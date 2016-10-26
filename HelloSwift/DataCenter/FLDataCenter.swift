//
//  FLDataCenter.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 26/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

class FLDataCenter: NSObject {
    class var sharedInstance: FLDataCenter {
        struct Static {
            static let instance: FLDataCenter = FLDataCenter()
        }
        return Static.instance
    }
    
    func GET(endURL:String, parameters:Dictionary<String,Any>, headers:Dictionary<String,Any>) {
    }
}


/*class FLDataCenter: NSObject {
    static let sharedInstance = FLDataCenter()
    
//        - (void)GET:(NSString *)endURL Parameters:(NSDictionary*)parameters Headers:(NSDictionary*)headers ReturnBlock:(DCNetworkBlock)returnBlock;

    func GET(endURL:String, parameters:Dictionary<String,Any>, headers:Dictionary<String,Any>) {
        
    }
    
}*/
