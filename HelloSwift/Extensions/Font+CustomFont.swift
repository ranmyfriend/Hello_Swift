//
//  FontExtensions.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 31/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

extension UIFont {
    
   class func appThemeRegularFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "ProximaNova-Regular", size: size)!
    }
    
    class func appThemeBoldFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "ProximaNova-Bold", size: size)!
    }
    
    class func appThemeMediumFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "ProximaNova-Semibold", size: size)!
    }
    
    class func appThemeLightFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "ProximaNova-Light", size: size)!
    }
    
    class func robotoRegularFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: size)!
    }
    
    class func robotoBoldFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: size)!
    }
    
    class func robotoMediumFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: size)!
    }
    
    class func robotoLightFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Light", size: size)!
    }
    
    class func robotoThinFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Thin", size: size)!
    }
    
    class func robotoBlackFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Black", size: size)!
    }
    
}
