//
//  LoginView.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 25/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import Foundation
import UIKit

class LoginView : UIView {
    
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
        
        self.backgroundColor = UIColor.white
        
        self.userNameTextField = UITextField()
        self.userNameTextField?.placeholder = "User Name"
        self.userNameTextField?.font = UIFont.systemFont(ofSize: 15)
        self.userNameTextField?.keyboardType = UIKeyboardType.emailAddress
        self.userNameTextField?.borderStyle = UITextBorderStyle.roundedRect
        self.addSubview(self.userNameTextField!)
        
        self.passwordTextField = UITextField()
        self.passwordTextField?.placeholder = "Password"
        self.passwordTextField?.font = UIFont.systemFont(ofSize: 15)
        self.passwordTextField?.keyboardType = UIKeyboardType.default
        self.passwordTextField?.borderStyle = UITextBorderStyle.roundedRect
        self.addSubview(self.passwordTextField!)
        
        self.submitButton = UIButton()
        self.submitButton?.backgroundColor = UIColor.black
        self.submitButton?.setTitle("Submit", for: UIControlState.normal)
        self.submitButton?.setTitleColor(UIColor.white, for: UIControlState.normal)
        self.submitButton?.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(self.submitButton!)
    }
}

