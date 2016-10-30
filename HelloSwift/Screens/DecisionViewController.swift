//
//  DecisionViewController.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 25/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

class DecisionViewController: BaseViewController,DecisionViewProtocol {

    // Note: We coult not directly override the self.view -> DecisionView
    // We are using computed property here. whenever you ask myView it will give you self.view as yourView.
    // Refer: https://blog.pivotal.io/labs/labs/extracting-uiviews-uiviewcontrollers-swift
    var myView: DecisionView! { return self.view as! DecisionView }
    
    override func loadView() {
        super.loadView()
        view = DecisionView.init(frame: UIScreen.main.bounds)
        myView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Decision Scene"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:: DecisionView Protocol
    func didTapLoginButton() {
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    func didTapSignupButton() {
        let signupVC = SignupViewController()
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
}
