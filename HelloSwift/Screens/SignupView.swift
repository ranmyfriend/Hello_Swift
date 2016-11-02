//
//  SignupView.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 26/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

protocol signupViewProtocol: class {
    func didTapSignupButton(userName:String?, email:String?, password:String?)
}

class SignupView: BaseView {

    var delegate: signupViewProtocol?
    
    var userNameTextFiled: ALTextField?
    var emailTextField: ALTextField?
    var passwordTextField: ALTextField?
    var submitButton: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func createViews() {
        
        self.backgroundColor = .white
        
        self.userNameTextFiled = ALTextField()
        self.userNameTextFiled?.setPlaceHolder(placeHolder: "User Name(Optional)")
        self.userNameTextFiled?.setKeyboardType(keyboardType: .default)
        self.addSubview(self.userNameTextFiled!)
        
        self.emailTextField = ALTextField()
        self.emailTextField?.setPlaceHolder(placeHolder: "Email Address")
        self.emailTextField?.setKeyboardType(keyboardType:.emailAddress)
        self.addSubview(self.emailTextField!)
        
        self.passwordTextField = ALTextField()
        self.passwordTextField?.setPlaceHolder(placeHolder: "Password")
        self.passwordTextField?.setKeyboardType(keyboardType: .default)
        self.addSubview(self.passwordTextField!)
        
        self.submitButton = UIButton()
        self.submitButton?.backgroundColor = .black
        self.submitButton?.setTitle("Submit", for: .normal)
        self.submitButton?.setTitleColor(.white, for: .normal)
        self.submitButton?.titleLabel?.font = .appThemeRegularFontWithSize(size: 17)
        self.submitButton?.layer.cornerRadius = 4.0
        self.submitButton?.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        self.addSubview(self.submitButton!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let topInset: CGFloat = 100.0
        let leftInset: CGFloat = 20.0
        let height: CGFloat = 40.0
        let avaialbleWidth: CGFloat
        avaialbleWidth = self.bounds.width - (2*leftInset)
        
        self.userNameTextFiled?.frame = CGRect(x:leftInset, y:topInset, width:avaialbleWidth, height:height)
        
        self.emailTextField?.frame = CGRect(x:leftInset, y:((self.userNameTextFiled?.frame)?.maxY)!+20, width:avaialbleWidth, height:height)
        
        self.passwordTextField?.frame = CGRect(x:leftInset, y:((self.emailTextField?.frame)?.maxY)!+20, width:avaialbleWidth, height:height)
        
        self.submitButton?.frame = CGRect(x:leftInset, y:((self.passwordTextField?.frame)?.maxY)!+50, width:avaialbleWidth, height:height+10)
    }
    
    // MARK:: Selectors
    
    @objc private func didTapSubmitButton() {
        self.delegate?.didTapSignupButton(userName: self.userNameTextFiled?.getText(), email: self.emailTextField?.getText(), password: self.passwordTextField?.getText())
    }
    
    // MARK:: Public Functions
    
    public func cleanup() {
        self.userNameTextFiled?.textField?.text = nil
        self.emailTextField?.textField?.text = nil
        self.passwordTextField?.textField?.text = nil
    }

}
