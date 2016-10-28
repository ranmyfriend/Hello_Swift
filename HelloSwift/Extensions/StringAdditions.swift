//
//  StringAdditions.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 28/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

extension String {
    
    func isEmail() ->Bool {
        let regExPattern = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regExPattern)
        return predicate.evaluate(with: self)
    }
    
}
