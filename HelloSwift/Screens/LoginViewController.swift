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
    
    func didTapSubmitButton() {
        let params: Dictionary<String,Any>? = ["key":"value"]
        let headers: Dictionary<String,Any>? = ["key":"value"]
        FLDataCenter.sharedInstance .GET(connectingURL: "https://api.spotify.com/v1/tracks/3n3Ppam7vgaVa1iaRUc9Lp", parameters: params!, headers: headers! as! Dictionary<String, String>) { (response, responseObject, error) in
            
        }
    }
}
