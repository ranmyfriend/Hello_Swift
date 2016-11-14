//
//  HomeView.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 28/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

class HomeView: BaseView {

    var tableView: UITableView?
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func createViews() {
        self.tableView = UITableView()
        self.tableView?.backgroundColor = .white
        self.tableView?.separatorColor = .white
        self.tableView?.tableFooterView = UIView()
        self.addSubview(self.tableView!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.tableView?.frame = self.bounds
    }

}
