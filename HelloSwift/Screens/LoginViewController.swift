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
    
    func didTapLoginButton() {
        let params: Dictionary<String,Any>? = ["key":"value"]
        let headers: Dictionary<String,Any>? = ["key":"value"]
        FLDataCenter.sharedInstance .GET(endURL: "", parameters: params!
            , headers: headers!)
    }
}
