//
//  BaseView.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 28/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

let ERROR_HUD_HEIGHT: CGFloat = 50.0

enum ErrorHudPosition {
    case top
    case bottom
}

enum ErrorHudBgColor {
    case red
    case blue
}

class BaseView: UIView {
    
    private var loadingView: ALLoadingView?
    private var errorHudView: ALHudView?
    private var isErrorHudAnimating: Bool?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        self.backgroundColor = UIColor.rgb(fromHex: 0xf3f3f3);
        self.loadingView = ALLoadingView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public func showLoadingViewWithMessage(message: String) {
        if(self.loadingView == nil) {
            self.loadingView = ALLoadingView()
        }
        self.loadingView?.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
        self.loadingView?.backgroundColor = UIColor.rgba(fromHex: 0x000, alpha: 0.6)
        if(!(UIApplication.shared.keyWindow?.subviews.contains(self.loadingView!))!) {
            UIApplication.shared.keyWindow?.addSubview(self.loadingView!)
        }
        
        UIApplication.shared.keyWindow?.bringSubview(toFront: self.loadingView!)
        
        if message.characters.count > 0 {
            self.loadingView?.lblLoadingMessage?.text = message
        }
        self.loadingView?.layoutSubviews()
        self.loadingView?.startAnimatingLoader()
    }
    
    public func hideLoadingView() {
        // Safer zone to find the loading view and remove it from SuperView
        
        var found: Bool = false
        for subview in (UIApplication.shared.keyWindow?.subviews)! {
            if(subview .isKind(of: ALLoadingView.self)) {
                found = true
                subview.removeFromSuperview()
                break
            }
        }
        if(!found) {
            debugPrint("self.loadingView does not contain any superview :(")
        }
        self.loadingView?.stopAnimatingLoader()
        self.loadingView?.removeFromSuperview()
    }
    
    public func showErrorHud(position: ErrorHudPosition, message:String, bgColor: ErrorHudBgColor) {
        if(self.errorHudView == nil) {
            self.errorHudView = ALHudView()
        }

        if(!(UIApplication.shared.keyWindow?.subviews.contains(self.errorHudView!))!) {
            UIApplication.shared.keyWindow?.addSubview(self.errorHudView!)
        }
        
        UIApplication.shared.keyWindow?.bringSubview(toFront: self.errorHudView!)

        if(message.characters.count > 0) {
            self.errorHudView?.lblErrorMessage?.text = message
        }
        switch bgColor {
        case .red:
            self.errorHudView?.backgroundColor = UIColor.rgb(fromHex:0xc0392b)
            break
        case .blue:
            self.errorHudView?.backgroundColor = UIColor.rgb(fromHex:0x3498db)
            break
        }
        switch position {
        case .top:
            self.animateFromTop()
            break
        case .bottom:
            self.animateFromBottom()
            break
        }
    }
    
    private func animateFromTop() {
        //Note: dont want to create duplicate huds
        if self.isErrorHudAnimating! { return }
        
        self.errorHudView?.frame = CGRect(x:0, y:-ERROR_HUD_HEIGHT, width:self.bounds.width, height:ERROR_HUD_HEIGHT)
        let duration: Double = 0.5
        UIView .animate(withDuration: duration, delay: 0.0, options: .curveEaseIn, animations: {
            self.isErrorHudAnimating = true
            self.errorHudView?.frame = CGRect(x:0, y:0, width:self.bounds.width, height:ERROR_HUD_HEIGHT)
        }) { (finished) in
            UIView .animate(withDuration: duration, delay: 2.0, options: .curveEaseIn, animations: {
                self.errorHudView?.frame = CGRect(x:0, y:-ERROR_HUD_HEIGHT, width:self.bounds.width, height:ERROR_HUD_HEIGHT)
                }, completion: { (finished) in
                    self.isErrorHudAnimating = false
            })
        }
    }
    
    private func animateFromBottom() {
        if self.isErrorHudAnimating! { return }

        self.errorHudView?.frame = CGRect(x:0, y:(self.bounds.height+ERROR_HUD_HEIGHT), width:self.bounds.width, height:ERROR_HUD_HEIGHT)
        let duration: Double = 0.5
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseIn, animations: {
            self.isErrorHudAnimating = true
            self.errorHudView?.frame = CGRect(x:0, y:self.bounds.height-ERROR_HUD_HEIGHT, width:self.bounds.width, height:ERROR_HUD_HEIGHT)
        }) { (finished) in
            UIView.animate(withDuration: duration, delay: 2.0, options: .curveEaseIn, animations: {
                self.errorHudView?.frame = CGRect(x:0, y:self.bounds.height+ERROR_HUD_HEIGHT, width:self.bounds.width, height:ERROR_HUD_HEIGHT)
                }, completion: { (finished) in
                    self.isErrorHudAnimating = false
            })
        }
    }
}

