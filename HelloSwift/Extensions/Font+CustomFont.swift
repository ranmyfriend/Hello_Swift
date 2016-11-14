//
//  FontExtensions.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 31/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

extension UIFont {
    
   class func appThemeRegularFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "ProximaNova-Regular", size: size)!
    }
    
    class func appThemeBoldFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "ProximaNova-Bold", size: size)!
    }
    
    class func appThemeMediumFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "ProximaNova-Semibold", size: size)!
    }
    
    class func appThemeLightFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "ProximaNova-Light", size: size)!
    }
    
    class func robotoRegularFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: size)!
    }
    
    class func robotoBoldFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: size)!
    }
    
    class func robotoMediumFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: size)!
    }
    
    class func robotoLightFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Light", size: size)!
    }
    
    class func robotoThinFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Thin", size: size)!
    }
    
    class func robotoBlackFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Black", size: size)!
    }
    
}
