//
//  LoginViewController.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 25/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController {
    
    override func loadView() {
//        view = LoginView(frame: UIScreen.main.bounds)
        super.loadView()
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login Scene"
        self.view = LoginView(frame: UIScreen.main.bounds)
    }
}
