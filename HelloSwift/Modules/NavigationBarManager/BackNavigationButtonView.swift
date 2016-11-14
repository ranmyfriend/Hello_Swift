//
//  BackNavigationButtonView.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 01/11/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

// Defines center's x co-ordinate value for button.
private let leftMargin:CGFloat = 25.0

class BackNavigationButtonView: UIView {

    open var selector: Any?
    weak open var target: AnyObject?
    fileprivate var clickButton: UIButton?
    
    init(frame:CGRect, target:AnyObject, selection:Any) {
        self.target = target
        self.selector = selection
        super.init(frame: frame)
        self.createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clickButton?.frame = CGRect(x:-leftMargin, y:0, width:self.bounds.width, height:self.bounds.height)
    }
    
    // MARK:: Private Functions
    fileprivate func createViews() {
        self.clickButton = UIButton()
        self.clickButton?.setTitleColor(UIColor(colorLiteralRed:51.0/255.0, green:51.0/255.0, blue:51.0/255.0, alpha:1.0), for: .normal)
        self.clickButton?.setTitleColor(UIColor(colorLiteralRed:213.0/255.0, green:213.0/255.0, blue:213.0/255.0, alpha:1.0), for: .highlighted)
        self.clickButton?.addTarget(self, action: #selector(didTapClickButton), for: .touchUpInside)
        self.clickButton?.setImage(UIImage(named: "back_icon"), for: .normal)
        self.clickButton?.setImage(UIImage(named: "back_icon"), for: .highlighted)
        self.clickButton?.setTitle("", for: .normal)
        // Magic numbers do not change.
        let leftImageInsets:CGFloat = -12
        let titleImageGap:CGFloat = -2
        let titleTopInset:CGFloat = 2
        self.clickButton?.imageEdgeInsets = UIEdgeInsetsMake(0, leftImageInsets, 0, titleImageGap)
        self.clickButton?.titleEdgeInsets = UIEdgeInsetsMake(titleTopInset, titleImageGap, 0, 0)
        self.addSubview(self.clickButton!)
    }
    
    @objc fileprivate func didTapClickButton() {}

}
