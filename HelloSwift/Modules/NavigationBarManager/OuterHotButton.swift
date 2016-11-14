//
//  OuterHotButton.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 01/11/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

private let outerMargin:CGFloat = 15.0

class OuterHotButton: UIButton {

    //these default to OUTER_MARGIN if not set
    open var yTapExtension:CGFloat?
    open var xTapExtension:CGFloat?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    fileprivate func commonInit() {
        self.createViews()
    }
    
    fileprivate func createViews() {
        self.clipsToBounds = false
        self.yTapExtension = outerMargin;
        self.xTapExtension = outerMargin;
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let bigRect = self.bounds.insetBy(dx: -self.xTapExtension!, dy: -self.yTapExtension!)
        if bigRect.contains(point) {
            return self
        }
        return nil
    }

}
