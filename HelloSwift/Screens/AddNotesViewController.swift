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
    func didTapSaveButton(_ title: String?, body: String?) {
        if (title?.isEmpty)! {
            self.showAlert("Hello", message: "Please drop some Title?")
        }else {
            self.myView.showLoadingViewWithMessage(Constants.savingNotesCaption)
            NotesActionsDataCenter.sharedInstance.addNotes(title, bodyText: body, completion:
                { (result) in
                    self.myView.hideLoadingView()
                    switch result
                    {
                    case .success(let note):
                        print(note!)
                        // Here if you dont give _ compiler will give warning - Expression of type uiviewcontroller is unused
                        //http://stackoverflow.com/questions/37843049/xcode-8-swift-3-expression-of-type-uiviewcontroller-is-unused-warning
                        _ = self.navigationController?.popViewController(animated: true)
                        break
                    case .failure(let error):
                        print(error!)
                        break
                    }
            })
        }
    }
    
}
