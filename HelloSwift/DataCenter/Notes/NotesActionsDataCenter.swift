//
//  NotesActionsDataCenter.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 28/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit
import SwiftyJSON

//Generic enum that represents the result
enum AsyncResult<T> {
    case Success(T)
    case Failure(Error?)
}

class NotesActionsDataCenter: NSObject {

    class var sharedInstance: NotesActionsDataCenter {
        struct Static {
            static let instance: NotesActionsDataCenter = NotesActionsDataCenter()
        }
        return Static.instance
    }
    
    func addNotes(title:String?, bodyText:String?, completion:@escaping (AsyncResult<AnyObject?>)->()) {
        
        let addNotesEndUrl = "data/Notes"
        
        var parameters = Dictionary<String,Any>()
        
        parameters["Title"] = title
        parameters["Body"] = bodyText
     
        FLDataCenter.sharedInstance.POST(connectingURL: addNotesEndUrl, parameters: parameters) {
            (urlResponse, urlResponseObject, error) in
            if let error = error {
                completion(AsyncResult.Failure(error))
            }else {
                completion(AsyncResult.Success(urlResponseObject as AnyObject?))
            }
        }
    }
    
    func fetchNotes(completion: @escaping (AsyncResult<[Data]>)->()) {
        let fetchNotesEndUrl = "data/Notes"
        
        FLDataCenter.sharedInstance.GET(connectingURL: fetchNotesEndUrl, parameters: nil) {
            (urlResponse, urlResponseObject, error) in

            if let error = error {
                completion(AsyncResult.Failure(error))
            } else {
                let json = JSON(urlResponseObject!)
                let data = FetchNotesResponse.init(json: json).data
                completion(AsyncResult.Success(data!))
            }
        }
    }
    
}
