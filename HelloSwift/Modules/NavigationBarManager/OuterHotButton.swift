//
//  OuterHotButton.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 01/11/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

fileprivate let OUTER_MARGIN:CGFloat = 15.0

class OuterHotButton: UIButton {

    //these default to OUTER_MARGIN if not set
    public var yTapExtension:CGFloat?
    public var xTapExtension:CGFloat?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    private func commonInit() {
        self.createViews()
    }
    
    private func createViews() {
        self.clipsToBounds = false
        self.yTapExtension = OUTER_MARGIN;
        self.xTapExtension = OUTER_MARGIN;
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let bigRect = self.bounds.insetBy(dx: -self.xTapExtension!, dy: -self.yTapExtension!)
        if bigRect.contains(point) {
            return self
        }
        return nil
    }

}
