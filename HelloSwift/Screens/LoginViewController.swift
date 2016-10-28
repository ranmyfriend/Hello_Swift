//
//  LoginViewController.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 25/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController,loginViewProtocol {
    
    var myView: LoginView! { return self.view as! LoginView }

    override func loadView() {
        super.loadView()
        view = LoginView.init(frame: UIScreen.main.bounds)
        myView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login Scene"
    }
    
    //MARK:: LoginViewProtocol methods
    
    func didTapSubmitButton(email: String?, password: String?) {
        if (email?.isEmpty)! {
            self.showAlert(title: "Hello", message: "Please enter your fucking email id?")
        }else if let check = email?.isEmail() , check == true {
            self.showAlert(title: "Hello", message: "Are you sure is this Email?")
        }else if(password?.isEmpty)! {
            self.showAlert(title: "Hello", message: "Please enter your fucking email Password?")
        }else {
            SignInDataCenter.sharedInstance.signin(email: email, password: password!){(response, responseObject, error) in
                if (error != nil) {
                    print("Server reported an error: \(error)")
                }else {
                    self.myView.cleanup()
                    print("User has been Logged in (ASYNC): \(response)")
                }
            }
        }
    }
}
