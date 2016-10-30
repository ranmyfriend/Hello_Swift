//
//  SignInDataCenter.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 28/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

class SignInDataCenter: NSObject {
    
    class var sharedInstance: SignInDataCenter {
        struct Static {
            static let instance: SignInDataCenter = SignInDataCenter()
        }
        return Static.instance
    }
    
    func signin(email:String?, password:String?, ReturnBlock:@escaping returnBlock) {
        
        let signinEndUrl = "users/login"
        
        var parameters = Dictionary<String,Any>()
        
        parameters["login"] = email
        parameters["password"] = password
        
        FLDataCenter.sharedInstance.POST(connectingURL: signinEndUrl, parameters: parameters) {
            (urlResponse, urlResponseObject, error) in
            ReturnBlock(urlResponse,urlResponseObject,error)
        }
    }
}
