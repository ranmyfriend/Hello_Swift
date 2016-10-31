//
//  ALLabel.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 31/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

class ALLabel: UILabel {

    public var padding:UIEdgeInsets?
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.textColor = UIColor.rgb(fromHex: 0x4A4A4A)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        super.draw(UIEdgeInsetsInsetRect(rect, self.padding!))
    }

    
}
