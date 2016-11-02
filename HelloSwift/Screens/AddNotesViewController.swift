//
//  AddNotesViewController.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 28/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//


class AddNotesViewController: BaseViewController,AddNotesProtocol {

    var myView: AddNotesView {return self.view as! AddNotesView}
    
    override func loadView() {
        super.loadView()
        view = AddNotesView.init(frame: UIScreen.main.bounds)
        myView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Notes"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:: AddNotes Protocol methods
    
  /*  responseObject: %@ Optional({
    Body = Fads;
    Title = Adds;
    "___class" = Notes;
    "__meta" = "{\"relationRemovalIds\":{},\"selectedProperties\":[\"created\",\"___saved\",\"___class\",\"Title\",\"ownerId\",\"Body\",\"updated\",\"objectId\"],\"relatedObjects\":{}}";
    created = 1477684910000;
    objectId = "95AA8DCF-070C-0EC1-FFCD-CB5BF91C9100";
    ownerId = "<null>";
    updated = "<null>";
    }) */
    
    func didTapSaveButton(title: String?, body: String?) {
        if (title?.isEmpty)! {
            self.showAlert(title: "Hello", message: "Please drop some Title?")
        }else {
         NotesActionsDataCenter.sharedInstance.addNotes(title: title, bodyText: body, ReturnBlock: { (urlResponse, responseObject, error) in
            if((error) != nil) {
                print("Error: %@",error!)
            }else {
                print("responseObject: %@",responseObject!)
            }
         })
        }
    }

}
