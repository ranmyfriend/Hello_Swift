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

    func signup(userName:String?, email:String?, password:String, ReturnBlock:@escaping returnBlock){

        let signupEndUrl = "users/register"
        
        var parameters = Dictionary<String,String>()
        
        parameters["email"] = email
        parameters["password"] = password
        parameters["name"] = userName
        
        let headers = ["application-id":"5836E8FC-4A51-E65E-FF4B-E684B637F100","secret-key":"7A7C25DB-A1C2-5587-FF3E-CEC9B684CE00","Content-Type":"application/json","application-type":"REST"]
        
        FLDataCenter.sharedInstance.POST(connectingURL: signupEndUrl, parameters: parameters, headers: headers) {
            (urlResponse, urlResponseObject, error) in
            
            ReturnBlock(urlResponse,urlResponseObject,error)
            
        }
    }
}
