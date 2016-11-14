//
//  SignUpDataCenter.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 28/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

class SignUpDataCenter: NSObject {
    
    class var sharedInstance: SignUpDataCenter {
        struct Static {
            static let instance: SignUpDataCenter = SignUpDataCenter()
        }
        return Static.instance
    }

    func signup(_ userName:String?, email:String?, password:String, ReturnBlock:@escaping returnBlock){

        let signupEndUrl = "users/register"
        
        var parameters = Dictionary<String,String>()
        
        parameters["email"] = email
        parameters["password"] = password
        parameters["name"] = userName
                
        FLDataCenter.sharedInstance.POST(signupEndUrl, parameters: parameters) {
            (urlResponse, urlResponseObject, error) in
            
            ReturnBlock(urlResponse,urlResponseObject,error)
        }
    }
}
