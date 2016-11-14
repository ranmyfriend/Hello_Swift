//
//  ComposeNotificationGroupBtnView.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 01/11/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

fileprivate let INTER_BUTTON_SPACING:CGFloat = 8.0

// Adding @objc keyword infront of protocol, you can make these func's as optional
@objc protocol ComposeNotificationGroupBtnViewProtocol:class {
    @objc optional func didTapComposeBtn(_ sender:Any)
    @objc optional func didTapSearchBtn(_ sender:Any)
}

class ComposeNotificationGroupBtnView: UIView {
    
    weak open var delegate: ComposeNotificationGroupBtnViewProtocol?
    fileprivate var composeButton: UIButton?
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func createViews() {
        let composeImage = UIImage(named: "compose")
        self.composeButton = UIButton(frame:(CGRect(x:INTER_BUTTON_SPACING, y:0, width:(composeImage?.size.width)!+INTER_BUTTON_SPACING, height:44)))
        self.composeButton?.setImage(composeImage, for: .normal)
        self.composeButton?.addTarget(self, action:#selector(didTapComposeButton), for: .touchUpInside)
        self.addSubview(self.composeButton!)
        
        //Using left Image edge inset as 8(30-22), for button image to be right aligned
        self.composeButton?.imageEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        let reqWidth:CGFloat = (self.composeButton?.frame.width)!+INTER_BUTTON_SPACING-1
        self.frame = CGRect(x:self.frame.origin.x, y:self.frame.origin.y, width:reqWidth, height:44)
        self.clipsToBounds = false
        
    }
    
    @objc fileprivate func didTapComposeButton(_ object:Any) {
        self.delegate?.didTapComposeBtn!(sender: object)
    }
    
    @objc fileprivate func didTapSearchButton(_ object:Any) {
        self.delegate?.didTapSearchBtn!(sender: object)
    }

}
