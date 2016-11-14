//
//  NavigationBarManager.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 01/11/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

private let backButtonText = ""

class NavigationBarManager: NSObject {
    
    open var barItemsFactory:BarButtonItemsFactory?

    class var sharedInstance: NavigationBarManager {
        struct Static {
            static let instance: NavigationBarManager = NavigationBarManager()
        }
        return Static.instance
    }
    
    override init() {
        super.init()
        self.barItemsFactory = BarButtonItemsFactory()
        self.barItemsFactory?.manager = self
    }
    
    //MARK:: Public Functions
    open func applyProperties(_ key:String, viewController:UIViewController, titleView:UIView?) {
        self.backButtonSettingsForViewController(viewController)
        if (titleView != nil) {
            viewController.navigationItem.titleView = titleView
        }
        let navBarDictionary = self.navBarDictForKey(key)
        if (navBarDictionary["left"] != nil)  {
            let leftBarButtonArray = self.barButtonItemsFromDictionaryArr(navBarDictionary["left"] as! [[String : String]], forViewController: viewController)
            viewController.navigationItem.hidesBackButton = true
            viewController.navigationItem.setLeftBarButtonItems(leftBarButtonArray,animated: true)
        }
        if(navBarDictionary["right"] != nil) {
            let rightBarButtonArray = self.barButtonItemsFromDictionaryArr(navBarDictionary["right"] as! [[String : String]], forViewController: viewController)
            viewController.navigationItem.setRightBarButtonItems(rightBarButtonArray, animated: false)
        }
    }
    
    //MARK:: Utitility methods.
    fileprivate func barButtonItemsFromDictionaryArr(_ dictArr:[[String:String]], forViewController:UIViewController) ->[UIBarButtonItem]? {
        if (dictArr.count == 0) {
            return nil
        }
        var barButtons = [UIBarButtonItem]()
        for dict in dictArr {
            if let barButtonItem = self.barItemsFactory?.barButtonItemForDictionary(dict, viewController: forViewController) {
                barButtons.append(barButtonItem)
            }
        }
        return barButtons
    }
    
    fileprivate func backButtonSettingsForViewController(_ viewController: UIViewController) {
        viewController.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back_icon")
        viewController.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back_icon")
        let backItem = UIBarButtonItem(title: backButtonText, style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = backItem
    }
    
    
    //MARK:: Private Functions - Navigation Bar methods.
    fileprivate func navBarDictForKey(_ propertyKey:String) -> [String:Any] {
        let navigationbarDictionary = self.navigationBarData() 
        return navigationbarDictionary![propertyKey] as! [String:Any]
    }
    
    fileprivate func navigationBarData() -> [String:Any]? {
        return
            ["navbar-type1":["right":[["key":"composeNotificationGroup"]]],
             "navbar-type1a":["right":[["key":"composeNotificationGroup"]],
                              "left":[["key":"inviteBtn"]]],
             "navbar-type2":["left":[["key":"cancelBtn"]],
                             "right":[["key":"nextBtn"]]],
             "navbar-type3":["right":[["key":"nextBtn"]]],
             "navbar-type4":["right":[["key":"doneBtn"]]],
             //FIXME: This is a temporary solution because title is not coming in center.
             "navbar-type5":["right":[["key":"emptyTextBtn"]]],
             "navbar-type6":["left":[["key":"cancelBtn"]]],
             "navbar-type7":["left":[["key":"cancelBtn"]],
                             "right":[["key":"doneBtn"]]],
             "navbar-type8":["left":[["key":"followAll"]]],
             "navbar-type9":["left":[["key":"cancelTextBtn"]],
                             "right":[["key":"sendBtn"]]],
             "navbar-type10":["right":[["key":"saveBtn"]]],
             "navbar-type11":["left":[["key":"searchIcon"]]],
                             "right":[["key":"cancelBtn"]],
                             "layoutProperties":["button_placement":"right"],
             "navbar-type12":["left":[["key":"dummyTextBtn"]],
                              "right":[["key":"cancelTextBtn"]]],
             "navbar-type13":["right":[["key":"spinner"]]],
             "navbar-type14":["left":[["key":"cancelTextBtn"]]],
             "navbar-type15":["left":[["key":"cancelTextBtn"]],"right":[["key":"nextBtn"]]]]
    }

}
