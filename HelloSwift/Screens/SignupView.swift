//
//  SignupView.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 26/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import TextFieldEffects

protocol signupViewProtocol: class {
    func didTapSignupButton(_ userName:String?, email:String?, password:String?)
}

class SignupView: BaseView,UITextFieldDelegate {

    var delegate: signupViewProtocol?
    
    var userNameTextFiled: HoshiTextField?
    var emailTextField: HoshiTextField?
    var passwordTextField: HoshiTextField?
    var submitButton: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func createViews() {
        
        self.backgroundColor = .white
        
        self.emailTextField = HoshiTextField()
        self.emailTextField?.placeholder = " Email"
        self.emailTextField?.keyboardType = .emailAddress
        self.emailTextField?.clearButtonMode = .whileEditing
        self.emailTextField?.delegate = self
        self.emailTextField?.returnKeyType = .next
        self.emailTextField?.borderStyle = .roundedRect
        self.emailTextField?.font = UIFont.appThemeRegularFontWithSize(16)
        self.emailTextField?.placeholderColor = .lightGray
        self.emailTextField?.placeholderLabel.font = UIFont.appThemeLightFontWithSize(16)
        self.addSubview(self.emailTextField!)
        
        self.userNameTextFiled = HoshiTextField()
        self.userNameTextFiled?.placeholder = " Full Name"
        self.userNameTextFiled?.keyboardType = .default
        self.userNameTextFiled?.clearButtonMode = .whileEditing
        self.userNameTextFiled?.delegate = self
        self.userNameTextFiled?.returnKeyType = .next
        self.userNameTextFiled?.borderStyle = .roundedRect
        self.userNameTextFiled?.font = UIFont.appThemeRegularFontWithSize(16)
        self.userNameTextFiled?.placeholderColor = .lightGray
        self.userNameTextFiled?.placeholderLabel.font = UIFont.appThemeLightFontWithSize(16)
        self.addSubview(self.userNameTextFiled!)
        
        self.passwordTextField = HoshiTextField()
        self.passwordTextField?.placeholder = " Password"
        self.passwordTextField?.keyboardType = .default
        self.passwordTextField?.clearButtonMode = .whileEditing
        self.passwordTextField?.delegate = self
        self.passwordTextField?.returnKeyType = .go
        self.passwordTextField?.isSecureTextEntry = true
        self.passwordTextField?.borderStyle = .roundedRect
        self.passwordTextField?.font = UIFont.appThemeRegularFontWithSize(16)
        self.passwordTextField?.placeholderColor = .lightGray
        self.passwordTextField?.placeholderLabel.font = UIFont.appThemeLightFontWithSize(16)
        self.addSubview(self.passwordTextField!)
        
        self.submitButton = UIButton()
        self.submitButton?.backgroundColor = .black
        self.submitButton?.setTitle("Submit", for: .normal)
        self.submitButton?.setTitleColor(.white, for: .normal)
        self.submitButton?.titleLabel?.font = .appThemeRegularFontWithSize(17)
        self.submitButton?.layer.cornerRadius = 4.0
        self.submitButton?.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        self.addSubview(self.submitButton!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let topInset: CGFloat = 100.0
        let leftInset: CGFloat = 20.0
        let height: CGFloat = 50.0
        let avaialbleWidth: CGFloat
        avaialbleWidth = self.bounds.width - (2*leftInset)
        
        self.userNameTextFiled?.frame = CGRect(x:leftInset, y:topInset, width:avaialbleWidth, height:height)
        
        self.emailTextField?.frame = CGRect(x:leftInset, y:((self.userNameTextFiled?.frame)?.maxY)!+20, width:avaialbleWidth, height:height)
        
        self.passwordTextField?.frame = CGRect(x:leftInset, y:((self.emailTextField?.frame)?.maxY)!+20, width:avaialbleWidth, height:height)
        
        self.submitButton?.frame = CGRect(x:leftInset, y:((self.passwordTextField?.frame)?.maxY)!+50, width:avaialbleWidth, height:50)
    }
    
    // MARK:: Selectors
    
    @objc private func didTapSubmitButton() {
        self.delegate?.didTapSignupButton(self.userNameTextFiled?.text, email: self.emailTextField?.text, password: self.passwordTextField?.text)
    }
    
    // MARK:: Public Functions
    
    public func cleanup() {
        self.userNameTextFiled?.text = ""
        self.emailTextField?.text = ""
        self.passwordTextField?.text = ""
    }

}
