//
//  AttributedString+CustomFont.swift
//  FlipFoto
//
//  Created by Ranjith Kumar on 12/11/2016.
//  Copyright © 2016 F22Labs. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    func bold(_ text:String) -> NSMutableAttributedString {
        let attrs:[String:AnyObject] = [NSFontAttributeName : UIFont.appThemeMediumFontWithSize(15)]
        let boldString = NSMutableAttributedString(string:"\(text)", attributes:attrs)
        self.append(boldString)
        return self
    }
    
    func normal(_ text:String)->NSMutableAttributedString {
        let attrs:[String:AnyObject] = [NSFontAttributeName : UIFont.appThemeRegularFontWithSize(15)]
        let normal = NSMutableAttributedString(string:"\(text)",attributes:attrs)
        self.append(normal)
        return self
    }
}
