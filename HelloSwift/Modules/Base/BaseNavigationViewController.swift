//
//  BaseNavigationViewController.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 28/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    var homeViewController: HomeViewController?
    var decisionViewController: DecisionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK:: Public Functions
    
    public func pushPreLoginScreen() {
        if(self.decisionViewController == nil) {
            self.decisionViewController = DecisionViewController()
        }
        
        if(self.topViewController?.isEqual(self.decisionViewController))! {
            self.popToViewController(self.decisionViewController!, animated: false)
        }else {
            self.pushViewController(self.decisionViewController!, animated: true)
        }
    }
    
    public func pushHomeScreen() {
        if (self.homeViewController == nil) {
            self.homeViewController = HomeViewController()
        }
        
        if(self.topViewController?.isEqual(self.homeViewController))! {
            self.popToViewController(self.homeViewController!, animated: false)
        }else {
            self.pushViewController(self.homeViewController!, animated: true)
        }
    }
    
}
