//
//  AttributedString+CustomFont.swift
//  FlipFoto
//
//  Created by Ranjith Kumar on 12/11/2016.
//  Copyright © 2016 F22Labs. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    func bold(text:String) -> NSMutableAttributedString {
        let attrs:[String:AnyObject] = [NSFontAttributeName : UIFont.appThemeMediumFontWithSize(size: 15)]
        let boldString = NSMutableAttributedString(string:"\(text)", attributes:attrs)
        self.append(boldString)
        return self
    }
    
    func normal(text:String)->NSMutableAttributedString {
        let attrs:[String:AnyObject] = [NSFontAttributeName : UIFont.appThemeRegularFontWithSize(size: 15)]
        let normal = NSMutableAttributedString(string:"\(text)",attributes:attrs)
        self.append(normal)
        return self
    }
}
