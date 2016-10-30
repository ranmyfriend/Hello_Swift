//
//  NotesActionsDataCenter.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 28/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit
import SwiftyJSON

class NotesActionsDataCenter: NSObject {

    class var sharedInstance: NotesActionsDataCenter {
        struct Static {
            static let instance: NotesActionsDataCenter = NotesActionsDataCenter()
        }
        return Static.instance
    }
    
    func addNotes(title:String?, bodyText:String?, ReturnBlock:@escaping returnBlock) {
        
        let addNotesEndUrl = "data/Notes"
        
        var parameters = Dictionary<String,Any>()
        
        parameters["Title"] = title
        parameters["Body"] = bodyText
     
        FLDataCenter.sharedInstance.POST(connectingURL: addNotesEndUrl, parameters: parameters) {
            (urlResponse, urlResponseObject, error) in
            ReturnBlock(urlResponse,urlResponseObject,error)
        }
    }
    
    func fetchNotes(returnBlock:@escaping returnBlock) {
        let fetchNotesEndUrl = "data/Notes"
        
        FLDataCenter.sharedInstance.GET(connectingURL: fetchNotesEndUrl, parameters: nil) {
            (urlResponse, urlResponseObject, error) in
                let json = JSON(urlResponseObject)
                let notesResponse = FetchNotesResponse.init(json: json)
            returnBlock(urlResponse,notesResponse.data,error)
        }
    }
    
}
