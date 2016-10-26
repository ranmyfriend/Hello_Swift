//
//  SignupViewController.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 26/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    var myView: SignupView {return self.view as! SignupView}
    
    override func loadView() {
        super.loadView()
        view = SignupView.init(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sign up"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
