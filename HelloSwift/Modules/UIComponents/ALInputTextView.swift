//
//  ALInputTextView.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 31/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

protocol ALLableProtocol:class {
    
    func didBeginEditing(_ view:UIView)
    func didEndEditing(_ view:UIView)
}

class ALInputTextView: UIView,UITextFieldDelegate {
    open var textField: UITextField?
    open var nextTextField: ALInputTextView?
    
    fileprivate var separator: UIView?
    fileprivate var lblTitle: UILabel?
    fileprivate var titleControl: UIControl?
    
    var delegate: ALLableProtocol?
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:: Public Functions
    open func setPlaceHolder(_ placeHolder:String){
        self.textField?.placeholder = placeHolder
        if(placeHolder.characters.count > 0) {
            let color:UIColor = UIColor.rgb(0xdcdada)
            self.textField?.attributedPlaceholder = NSAttributedString.init(string: placeHolder, attributes: [NSForegroundColorAttributeName:color, NSFontAttributeName:UIFont.appThemeRegularFontWithSize(16)])
        }
    }
    
    open func setKeyboardType(_ keyboardType:UIKeyboardType){
        self.textField?.keyboardType = keyboardType
    }
    
    open func setReturnKeyType(_ returnKeyType:UIReturnKeyType){
        self.textField?.returnKeyType = returnKeyType
    }
    
    open func setTextFieldToPasswordMode(){
        self.textField?.isSecureTextEntry = true
    }
    
    open func setupInputView(_ inputView:UIView){
        self.textField?.inputView = inputView;
    }
    
    open func verifyNumberOnly() ->Bool {
        return (self.textField?.text?.isNumberOnly())!
    }
    
    open func verifyEmailOnly() ->Bool {
        return (self.textField?.text?.isEmail())!
    }
    
    open func isEmpty() ->Bool {
        if(self.textField?.text?.isEmpty)! {
            return true
        }
        return false
    }
    
    open func getText() ->String {
        return (self.textField?.text)!
    }
    
    // Here we are setting clear color for Cursor on if(TextFiled.has(inputview))
    open func cursonPoint(_ show:Bool) {
        if(!show) {
         var val = self.textField?.value(forKey: "textInputTraits") as! Dictionary<String,UIColor>
            val["insertionPointColor"] = .clear
        }
    }
    
    //MARK:: Private Functions
    
    fileprivate func createViews() {
        self.backgroundColor = .clear
        
        self.lblTitle = UILabel()
        self.lblTitle?.text = ""
        self.lblTitle?.textColor = UIColor.rgb(0xdcdada)
        self.lblTitle?.textAlignment = .left
        self.lblTitle?.font = UIFont.appThemeRegularFontWithSize(16)
        self.addSubview(self.lblTitle!)
        
        self.titleControl = UIControl()
        self.titleControl?.addTarget(self, action: #selector(makeFirstResponder), for: .touchUpInside)
        self.addSubview(self.titleControl!)
        
        self.textField = UITextField()
        self.textField?.backgroundColor = .white
        self.textField?.textAlignment = .left
        self.textField?.keyboardType = .default
        self.textField?.font = UIFont.appThemeRegularFontWithSize(16)
        self.textField?.textColor = .black
        self.textField?.delegate = self
        self.textField?.returnKeyType = .done
        self.textField?.autocapitalizationType = .none
        self.textField?.clearButtonMode = .whileEditing
        self.textField?.enablesReturnKeyAutomatically = true
        self.addSubview(self.textField!)
        
        self.separator = UIView()
        self.separator?.backgroundColor = UIColor.rgb(0xdcdada)
        self.addSubview(self.separator!)
        
        self.clipsToBounds = true

    }
    
    // MARK:: Selectors
  
    @objc private func makeFirstResponder(){
        self.textField?.becomeFirstResponder()
    }
    
    // MARK:: UITextFieldDelegate Methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.delegate?.didBeginEditing(self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.delegate?.didEndEditing(self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField?.resignFirstResponder()
        if (self.nextTextField != nil) {
            self.nextTextField?.makeFirstResponder()
        }
        return true
    }

}
