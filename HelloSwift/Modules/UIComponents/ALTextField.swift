//
//  ALTextField.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 31/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

protocol MyTextFieldProtocol:class {

    func didBeginEditing(_ view:UIView)
    func didEndEditing(_ view:UIView)
    func didTapReturnKey(_ view:UIView)
}

class ALTextField: UIView,UITextFieldDelegate {

    open var textField: UITextField?
    open var nextTextField: ALTextField?
    fileprivate var separator: UIView?
    
    var delegate: MyTextFieldProtocol?
    
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
    
    open func makeFirstResponder(){
        self.textField?.becomeFirstResponder()
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
    
    // MARK:: UITextField Delegate methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.delegate?.didBeginEditing(self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.textField?.resignFirstResponder()
        self.delegate?.didEndEditing(self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField?.resignFirstResponder()
        self.nextTextField?.makeFirstResponder()
        self.delegate?.didTapReturnKey(self)
        return true
    }
    
    // MARK:: Private Functions
    
    fileprivate func createViews() {
        self.backgroundColor = .clear
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
        
    override func layoutSubviews() {
         super.layoutSubviews()
        let leftInset:CGFloat = 10
        
        self.textField?.frame = CGRect(x:leftInset, y:0, width:self.bounds.width-2*leftInset, height:self.bounds.height-1)
        self.separator?.frame = CGRect(x:leftInset, y:self.bounds.height-1, width:self.bounds.width-2*leftInset, height:1)
    }
    
}
