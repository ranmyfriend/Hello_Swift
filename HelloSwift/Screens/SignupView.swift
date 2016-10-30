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
    
    var userNameTextFiled: UITextField?
    var emailTextField: UITextField?
    var passwordTextField: UITextField?
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
        
        self.userNameTextFiled = UITextField()
        self.userNameTextFiled?.borderStyle = .roundedRect
        self.userNameTextFiled?.placeholder = "User Name(Optional)"
        self.userNameTextFiled?.keyboardType = .default
        self.addSubview(self.userNameTextFiled!)
        
        self.emailTextField = UITextField()
        self.emailTextField?.borderStyle = .roundedRect
        self.emailTextField?.placeholder = "Email Address"
        self.emailTextField?.keyboardType = .emailAddress
        self.addSubview(self.emailTextField!)
        
        self.passwordTextField = UITextField()
        self.passwordTextField?.placeholder = "Password"
        self.passwordTextField?.keyboardType = .default
        self.passwordTextField?.borderStyle = .roundedRect
        self.addSubview(self.passwordTextField!)
        
        self.submitButton = UIButton()
        self.submitButton?.backgroundColor = .black
        self.submitButton?.setTitle("Submit", for: .normal)
        self.submitButton?.setTitleColor(.white, for: .normal)
        self.submitButton?.titleLabel?.font = .systemFont(ofSize: 17)
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
        
        self.submitButton?.frame = CGRect(x:leftInset, y:((self.passwordTextField?.frame)?.maxY)!+50, width:avaialbleWidth, height:height)
    }
    
    // MARK:: Selectors
    
    @objc private func didTapSubmitButton() {
        self.delegate?.didTapSignupButton(userName: self.userNameTextFiled?.text, email: self.emailTextField?.text, password: self.passwordTextField?.text)
    }
    
    // MARK:: Public Functions
    
    public func cleanup() {
        self.userNameTextFiled?.text = nil
        self.emailTextField?.text = nil
        self.passwordTextField?.text = nil
    }

}
