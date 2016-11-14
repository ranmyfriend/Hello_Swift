//
//  BarButtonItemsFactory.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 01/11/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

class BarButtonItemsFactory: NSObject {
    
    open var manager:NavigationBarManager?
    
    open func barButtonItemForDictionary(_ navBarDict:[String:String], viewController:UIViewController) -> UIBarButtonItem? {
        let selector = NSSelectorFromString((navBarDict["key"]?.appending("WithProperties:viewController:"))!)
        let barButtonItem = self.perform(selector, with: navBarDict,with: viewController)
        return barButtonItem?.takeUnretainedValue() as? UIBarButtonItem
    }
    
    //MARK:: BarButtonItems
    internal func composeNotificationGroup(_ properties:Dictionary<String,String>, viewController:UIViewController) ->UIBarButtonItem {
        let barButton = UIBarButtonItem()
        let customView = ComposeNotificationGroupBtnView.init(frame: CGRect(x:0, y:0, width:66.0, height:22.0))
        if let _ = viewController.self as? ComposeNotificationGroupBtnViewProtocol {
            customView.delegate = viewController as? ComposeNotificationGroupBtnViewProtocol
        }
        barButton.customView = customView
        return barButton
    }
    
    internal func composeBtn(_ properties:Dictionary<String,Any>, viewController:UIViewController) ->UIBarButtonItem {
        let composeBarButton = UIBarButtonItem()
        composeBarButton.tintColor = UIColor.init(colorLiteralRed: 72.0/355.0, green: 119/355.0, blue: 244.0/355.0, alpha: 1.0)
        composeBarButton.image = UIImage(named: "compose")
        return composeBarButton
    }
    internal func cancelBtn(_ properties:Dictionary<String,Any>, viewController:UIViewController) ->UIBarButtonItem {
        let cancelBarButton = UIBarButtonItem()
        let cancelView:OuterHotButton = OuterHotButton()
        let crossImage = UIImage(named:"crossWhite")
        cancelView.setImage(crossImage, for: .normal)
        cancelView.setImage(crossImage, for: .disabled)
        
        var isRightSide = false
        let buttonPlacementString = properties["button_placement"] as! String?
        if(buttonPlacementString == "right") {
            isRightSide = true
        }
        if(!isRightSide) {
            cancelView.frame = CGRect(x:-1, y:0, width:(crossImage?.size.width)!, height:(crossImage?.size.height)!)
            cancelView.frame = CGRect(x:0, y:0, width:(crossImage?.size.width)!, height:(crossImage?.size.height)!)
        }else {
            cancelView.frame = CGRect(x:1, y:0, width:(crossImage?.size.width)!, height:(crossImage?.size.height)!)
            cancelView.frame = CGRect(x:0, y:0, width:(crossImage?.size.width)!, height:(crossImage?.size.height)!)
        }
        
        cancelBarButton.customView = cancelView
        
        cancelView.addTarget(viewController, action:Selector(("cancelBtnClicked")), for: .touchUpInside)
        return cancelBarButton
    }
    
    internal func nextBtn(_ properties:Dictionary<String,Any>, viewController:UIViewController) -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x:0, y:0, width:0, height:0))
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .disabled)
        button.titleLabel?.font = UIFont.appThemeRegularFontWithSize(17)
        button.sizeToFit()
        button.addTarget(viewController, action:Selector(("nextBtnClicked")), for: .touchUpInside)

        let nextButton = UIBarButtonItem()
        nextButton.customView = button
        nextButton.isEnabled = false
        return nextButton
    }
    
    internal func cancelTextBtn(_ properties:Dictionary<String,Any>, viewController:UIViewController) -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x:0, y:0, width:0, height:0))
        button.setTitle("CANCEL", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .disabled)
        button.titleLabel?.font = UIFont.appThemeRegularFontWithSize(17)
        button.sizeToFit()
        button.addTarget(viewController, action:Selector(("cancelBtnClicked")), for: .touchUpInside)
        
        let nextButton = UIBarButtonItem()
        nextButton.customView = button
        nextButton.isEnabled = true
        return nextButton
    }
    
    internal func doneBtn(_ properties:Dictionary<String,Any>, viewController:UIViewController) -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x:0, y:0, width:0, height:0))
        button.setTitle("DONE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .disabled)
        button.titleLabel?.font = UIFont.appThemeRegularFontWithSize(17)
        button.sizeToFit()
        button.addTarget(viewController, action:Selector(("doneBtnClicked")), for: .touchUpInside)
        
        let nextButton = UIBarButtonItem()
        nextButton.customView = button
        nextButton.isEnabled = false
        return nextButton
    }
    
    internal func emptyTextBtn(_ properties:Dictionary<String,Any>, viewController:UIViewController) -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x:0, y:0, width:0, height:0))
        button.setTitle(" ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .disabled)
        button.titleLabel?.font = UIFont.appThemeRegularFontWithSize(17)
        button.sizeToFit()
        
        let nextButton = UIBarButtonItem()
        nextButton.customView = button
        nextButton.isEnabled = true
        return nextButton
    }
    
    internal func dummyTextBtn(_ properties:Dictionary<String,Any>, viewController:UIViewController) -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x:0, y:0, width:0, height:0))
        button.setTitle(" ", for: .normal)
        
        let nextButton = UIBarButtonItem()
        nextButton.customView = button
        nextButton.isEnabled = true
        return nextButton
    }

    internal func spinner(_ properties:Dictionary<String,Any>, viewController:UIViewController) -> UIBarButtonItem {
        let spinner = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)
        let spinnerBarButon = UIBarButtonItem()
        spinnerBarButon.customView = spinner
        spinnerBarButon.isEnabled = false
        return spinnerBarButon
    }
    
    internal func locationBtn(_ properties:Dictionary<String,Any>, viewController:UIViewController) ->UIBarButtonItem {
        let button = UIButton.init(frame: CGRect(x:0, y:0, width:0, height:0))
        button.setImage(UIImage(named:"location"), for: .normal)
        button.sizeToFit()
        button.frame = CGRect(x:0, y:0, width:20, height:20)
        button.addTarget(viewController, action: Selector(("locationIconButtonClicked")), for: .touchUpInside)
        let locationIconButton = UIBarButtonItem.init(customView: button)
        locationIconButton.isEnabled = true
        return locationIconButton
    }
    
    internal func followAllWith(_ properties:Dictionary<String,Any>, viewController:UIViewController) ->UIBarButtonItem {
        let button = UIButton.init(frame: CGRect(x:0, y:0, width:0, height:0))
        button.setTitle("FOLLOW ALL", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .disabled)
        button.titleLabel?.font = UIFont.appThemeRegularFontWithSize(17)
        button.sizeToFit()
        button.addTarget(viewController, action: Selector(("followAllBtnClicked")), for: .touchUpInside)
        let followAllButton = UIBarButtonItem.init(customView: button)
        followAllButton.isEnabled = false
        return followAllButton
    }
    
    internal func sendBtn(_ properties:Dictionary<String,Any>, viewController:UIViewController) ->UIBarButtonItem {
        let button = UIButton.init(frame: CGRect(x:0, y:0, width:0, height:0))
        button.setTitle("SEND", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .disabled)
        button.titleLabel?.font = UIFont.appThemeRegularFontWithSize(17)
        button.sizeToFit()
        button.addTarget(viewController, action: Selector(("sendBtnClicked")), for: .touchUpInside)
        let sendButton = UIBarButtonItem.init(customView: button)
        sendButton.isEnabled = false
        return sendButton
    }
    
    internal func saveBtn(_ properties:Dictionary<String,Any>, viewController:UIViewController) ->UIBarButtonItem {
        let button = UIButton.init(frame: CGRect(x:0, y:0, width:0, height:0))
        button.setTitle("SAVE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .disabled)
        button.titleLabel?.font = UIFont.appThemeRegularFontWithSize(17)
        button.sizeToFit()
        button.addTarget(viewController, action: Selector(("saveBtnClicked")), for: .touchUpInside)
        let saveButton = UIBarButtonItem.init(customView: button)
        saveButton.isEnabled = false
        return saveButton
    }
    
    internal func searchIcon(_ properties:[String:Any], viewController:UIViewController) ->UIBarButtonItem {
        let button = UIButton.init(frame: CGRect(x:0, y:0, width:0, height:0))
        button.setImage(UIImage(named:"icon_search"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -2, 0, 2)
        button.sizeToFit()
        button.frame = CGRect(x:0, y:0, width:button.bounds.width + 1, height:button.bounds.height);
        let searchButton = UIBarButtonItem.init(customView: button)
        searchButton.isEnabled = false
        return searchButton
    }
    
    internal func inviteBtn(_ properties:Dictionary<String,Any>, viewController:UIViewController) ->UIBarButtonItem {
        let button = UIButton.init(frame: CGRect(x:0, y:0, width:0, height:0))
        button.setImage(UIImage(named:"invite_user"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -2, 0, 2)
        button.sizeToFit()
        button.addTarget(self, action: Selector(("inviteBtnClicked")), for: .touchUpInside)
        button.frame = CGRect(x:0, y:0, width:button.bounds.width + 1, height:button.bounds.height);
        let inviteButton = UIBarButtonItem.init(customView: button)
        inviteButton.isEnabled = true
        return inviteButton
    }
    
}
