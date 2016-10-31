//
//  ViewControllerAdditions.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 28/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

extension UIViewController {
    
    func showAlert(title:String?, message:String?) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let okButtonAction = UIAlertAction.init(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okButtonAction)
        self .present(alertController, animated: true, completion: nil)
    }
    
}
