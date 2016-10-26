//
//  LoginViewController.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 25/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController {
    
    var myView: LoginView! { return self.view as! LoginView }

    override func loadView() {
        super.loadView()
        view = LoginView.init(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login Scene"
    }
}
