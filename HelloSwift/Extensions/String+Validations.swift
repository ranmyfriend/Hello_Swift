//
//  StringAdditions.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 28/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

extension String {
    
   public func isEmail() ->Bool {
        let regExPattern = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regExPattern)
        if (!self.containsEmoji && predicate.evaluate(with: self)) {
            return true;
        }
        return false;
    }

   public func isNumberOnly() -> Bool {
        if (self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil) && !self.containsEmoji {
            return true
        }
        return false
    }
    
   
   private var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x2600...0x26FF,   // Misc symbols
            0x2700...0x27BF,   // Dingbats
            0xFE00...0xFE0F:   // Variation Selectors
                return true
            default:
                continue
            }
        }
        return false
    }

   
}
