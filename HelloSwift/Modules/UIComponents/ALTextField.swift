//
//  ALTextField.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 31/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

protocol MyTextFieldProtocol:class {

    func didBeginEditing(view:UIView)
    func didEndEditing(view:UIView)
    func didTapReturnKey(view:UIView)
}

class ALTextField: UIView,UITextFieldDelegate {

    public var textField: UITextField?
    public var nextTextField: ALTextField?
    private var separator: UIView?
    
    var delegate: MyTextFieldProtocol?
    
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
    
    public func makeFirstResponder(){
        self.textField?.becomeFirstResponder()
    }
    
    public func setupInputView(inputView:UIView){
        self.textField?.inputView = inputView;
    }
    
    public func verifyNumberOnly() ->Bool {
        return (self.textField?.text?.isNumberOnly())!
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
    
    // MARK:: UITextField Delegate methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.delegate?.didBeginEditing(view:self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.textField?.resignFirstResponder()
        self.delegate?.didEndEditing(view:self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField?.resignFirstResponder()
        self.nextTextField?.makeFirstResponder()
        self.delegate?.didTapReturnKey(view:self)
        return true
    }
    
    // MARK:: Private Functions
    
    private func createViews() {
        self.backgroundColor = .clear
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
        
    override func layoutSubviews() {
         super.layoutSubviews()
        let leftInset:CGFloat = 10
        
        self.textField?.frame = CGRect(x:leftInset, y:0, width:self.bounds.width-2*leftInset, height:self.bounds.height-1)
        self.separator?.frame = CGRect(x:leftInset, y:self.bounds.height-1, width:self.bounds.width-2*leftInset, height:1)
    }
    
}
