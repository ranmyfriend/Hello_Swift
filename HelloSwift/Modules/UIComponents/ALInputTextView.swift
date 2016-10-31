//
//  ALInputTextView.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 31/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

protocol ALLableProtocol:class {
    
    func didBeginEditing(view:UIView)
    func didEndEditing(view:UIView)
}

class ALInputTextView: UIView,UITextFieldDelegate {
    public var textField: UITextField?
    public var nextTextField: ALInputTextView?
    
    private var separator: UIView?
    private var lblTitle: UILabel?
    private var titleControl: UIControl?
    
    var delegate: ALLableProtocol?
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:: Public Functions
    public func setPlaceHolder(placeHolder:String){
        self.textField?.placeholder = placeHolder
        if(placeHolder.characters.count > 0) {
            let color:UIColor = UIColor.rgb(fromHex:0xdcdada)
            self.textField?.attributedPlaceholder = NSAttributedString.init(string: placeHolder, attributes: [NSForegroundColorAttributeName:color, NSFontAttributeName:UIFont.appThemeRegularFontWithSize(size:16)])
        }
    }
    
    public func setKeyboardType(keyboardType:UIKeyboardType){
        self.textField?.keyboardType = keyboardType
    }
    
    public func setReturnKeyType(returnKeyType:UIReturnKeyType){
        self.textField?.returnKeyType = returnKeyType
    }
    
    public func setTextFieldToPasswordMode(){
        self.textField?.isSecureTextEntry = true
    }
    
    public func setupInputView(inputView:UIView){
        self.textField?.inputView = inputView;
    }
    
    public func verifyNumberOnly() ->Bool {
        return (self.textField?.text?.verifyNumberOnly())!
    }
    
    public func verifyEmailOnly() ->Bool {
        return (self.textField?.text?.isEmail())!
    }
    
    public func isEmpty() ->Bool {
        if(self.textField?.text?.isEmpty)! {
            return true
        }
        return false
    }
    
    public func getText() ->String {
        return (self.textField?.text)!
    }
    
    // Here we are setting clear color for Cursor on if(TextFiled.has(inputview))
    public func cursonPoint(show:Bool) {
        if(!show) {
         var val = self.textField?.value(forKey: "textInputTraits") as! Dictionary<String,UIColor>
            val["insertionPointColor"] = .clear
        }
    }
    
    //MARK:: Private Functions
    
    private func createViews() {
        self.backgroundColor = .clear
        
        self.lblTitle = UILabel()
        self.lblTitle?.text = ""
        self.lblTitle?.textColor = UIColor.rgb(fromHex: 0xdcdada)
        self.lblTitle?.textAlignment = .left
        self.lblTitle?.font = UIFont.appThemeRegularFontWithSize(size: 16)
        self.addSubview(self.lblTitle!)
        
        self.titleControl = UIControl()
        self.titleControl?.addTarget(self, action: #selector(makeFirstResponder), for: .touchUpInside)
        self.addSubview(self.titleControl!)
        
        self.textField = UITextField()
        self.textField?.backgroundColor = .white
        self.textField?.textAlignment = .left
        self.textField?.keyboardType = .default
        self.textField?.font = UIFont.appThemeRegularFontWithSize(size: 16)
        self.textField?.textColor = .black
        self.textField?.delegate = self
        self.textField?.returnKeyType = .done
        self.textField?.autocapitalizationType = .none
        self.textField?.clearButtonMode = .whileEditing
        self.textField?.enablesReturnKeyAutomatically = true
        self.addSubview(self.textField!)
        
        self.separator = UIView()
        self.separator?.backgroundColor = UIColor.rgb(fromHex: 0xdcdada)
        self.addSubview(self.separator!)
        
        self.clipsToBounds = true

    }
    
    // MARK:: Selectors
  
    @objc private func makeFirstResponder(){
        self.textField?.becomeFirstResponder()
    }
    
    // MARK:: UITextFieldDelegate Methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.delegate?.didBeginEditing(view: self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.delegate?.didEndEditing(view: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField?.resignFirstResponder()
        if (self.nextTextField != nil) {
            self.nextTextField?.makeFirstResponder()
        }
        return true
    }

}
