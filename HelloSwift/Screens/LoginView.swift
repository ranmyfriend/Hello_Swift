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
        
        self.emailTextField = ALTextField()
        self.emailTextField?.setPlaceHolder(placeHolder: "Email")
        self.emailTextField?.setKeyboardType(keyboardType: .emailAddress)
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
    
    //MARK:: Selectors
    
   @objc private func didTapSubmitButton() {
        self.delegate?.didTapSubmitButton(email: self.emailTextField?.getText(), password: self.passwordTextField?.getText())
    }
    
    //MARK:: Public Functions
    
    public func cleanup() {
        self.emailTextField?.textField?.text = nil
        self.passwordTextField?.textField?.text = nil
    }
    
}
