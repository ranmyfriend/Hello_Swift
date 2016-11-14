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
        self.navigationBarSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:: Public Functions
    
    open func pushPreLoginScreen() {
        if(self.decisionViewController == nil) {
            self.decisionViewController = DecisionViewController()
        }
        
        if(self.topViewController?.isEqual(self.decisionViewController))! {
            self.popToViewController(self.decisionViewController!, animated: false)
        }else {
            // Note: Show is updated one
            self.show(self.decisionViewController!, sender: self)
        }
    }
    
    open func pushHomeScreen() {
        if (self.homeViewController == nil) {
            self.homeViewController = HomeViewController()
        }
        
        if(self.topViewController?.isEqual(self.homeViewController))! {
            self.popToViewController(self.homeViewController!, animated: false)
        }else {
            self.show(self.homeViewController!, sender: self)
        }
    }
    
    // MARK:: Private Functions
    
    fileprivate func navigationBarSetup() {
        self.navigationBar.barTintColor = .green
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = .white
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,NSFontAttributeName:UIFont.appThemeRegularFontWithSize(18)]
    }
}
