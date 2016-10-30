//
//  LoginView.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 25/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

protocol loginViewProtocol: class {
    func didTapSubmitButton(email:String?, password:String?)
}

class LoginView : BaseView {
    
    weak var delegate: loginViewProtocol?
    
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

    override func layoutSubviews() {
        let topInset: CGFloat = 100.0
        let leftInset: CGFloat = 20.0
        let height: CGFloat = 40.0
        let padding: CGFloat = 20.0
        let availableWidth = self.bounds.size.width - (2*leftInset);
        
        self.emailTextField?.frame = CGRect(x:leftInset, y: topInset, width:availableWidth, height:height)
        
        self.passwordTextField?.frame = CGRect(x:leftInset, y:((self.emailTextField?.frame)!.maxY+padding), width:availableWidth, height: height)
        
        self.submitButton?.frame = CGRect(x:leftInset, y:((self.passwordTextField?.frame)!.maxY+50), width:availableWidth, height:(height+10))
    }
    
   private func createViews() {
        
        self.backgroundColor = .white
        
        self.emailTextField = UITextField()
        self.emailTextField?.placeholder = "Email"
        self.emailTextField?.font = .systemFont(ofSize: 15)
        self.emailTextField?.keyboardType = .emailAddress
        self.emailTextField?.borderStyle = .roundedRect
        self.addSubview(self.emailTextField!)
        
        self.passwordTextField = UITextField()
        self.passwordTextField?.placeholder = "Password"
        self.passwordTextField?.font = .systemFont(ofSize: 15)
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
    
    //MARK:: Selectors
    
   @objc private func didTapSubmitButton() {
        self.delegate?.didTapSubmitButton(email: self.emailTextField?.text, password: self.passwordTextField?.text)
    }
    
    //MARK:: Public Functions
    
    public func cleanup() {
        self.emailTextField?.text = nil
        self.passwordTextField?.text = nil
    }
    
}

