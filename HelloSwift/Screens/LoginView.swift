//
//  LoginView.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 25/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import Foundation
import UIKit

protocol loginViewProtocol: class {
    func didTapLoginButton()
}

class LoginView : UIView {
    
    weak var delegate: loginViewProtocol?
    
    var userNameTextField: UITextField?
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
        
        self.userNameTextField?.frame = CGRect(x:leftInset, y: topInset, width:availableWidth, height:height)
        
        self.passwordTextField?.frame = CGRect(x:leftInset, y:((self.userNameTextField?.frame)!.maxY+padding), width:availableWidth, height: height)
        
        self.submitButton?.frame = CGRect(x:leftInset, y:((self.passwordTextField?.frame)!.maxY+50), width:availableWidth, height:(height+10))
    }
    
    func createViews() {
        
        self.backgroundColor = .white
        
        self.userNameTextField = UITextField()
        self.userNameTextField?.placeholder = "User Name"
        self.userNameTextField?.font = .systemFont(ofSize: 15)
        self.userNameTextField?.keyboardType = .emailAddress
        self.userNameTextField?.borderStyle = .roundedRect
        self.addSubview(self.userNameTextField!)
        
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
        self.addSubview(self.submitButton!)
    }
}

