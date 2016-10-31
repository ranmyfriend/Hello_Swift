//
//  SignupViewController.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 26/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

class SignupViewController: BaseViewController,signupViewProtocol {
    
    var myView: SignupView {return self.view as! SignupView}
    
    override func loadView() {
        super.loadView()
        view = SignupView.init(frame: UIScreen.main.bounds)
        myView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sign up"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:: SignupViewProtocol methods
    
    func didTapSignupButton(userName: String?, email: String?, password: String?) {
        
        if (email?.isEmpty)! {
            self.showAlert(title: "Hello", message: "Please enter your fucking email id?")
        }else if let check = email?.isEmail() , check == true {
            self.showAlert(title: "Hello", message: "Are you sure is this Email?")
        }else if(password?.isEmpty)! {
            self.showAlert(title: "Hello", message: "Please enter your fucking email Password?")
        }else {
            self.myView.showLoadingViewWithMessage(message: Constants.pleaseWaitCaption)
            SignUpDataCenter.sharedInstance.signup(userName: userName, email: email, password: password!){(response, responseObject, error) in
                self.myView.hideLoadingView()
                if (error != nil) {
                    print("Server reported an error: \(error)")
                }else {
                    self.myView.cleanup()
                    print("User has been registered (ASYNC): \(response)")
                    
                }
            }
        }
    }
}
