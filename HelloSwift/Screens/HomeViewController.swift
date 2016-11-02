//
//  HomeViewController.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 28/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var myView: HomeView{return self.view as! HomeView}
    
    var dataSource: Array<Data> = [] {
        didSet {
            self.myView.tableView?.reloadData()
        }
    }
    
    override func loadView() {
        super.loadView()
        view = HomeView.init(frame: UIScreen.main.bounds)
        self.myView.tableView?.delegate = self
        self.myView.tableView?.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Home"
        if(self.navigationItem.rightBarButtonItem == nil) {
            let addNoteBarButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(didTapAddNotesButton))
            self.navigationItem.rightBarButtonItem = addNoteBarButton
        }
        if(self.navigationItem.leftBarButtonItem == nil) {
            let logoutBarButton = UIBarButtonItem.init(title: "Logout", style: .done, target: self, action: #selector(didTapLogoutButton))
            self.navigationItem.leftBarButtonItem = logoutBarButton
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchNotes()
        self.myView.tableView?.register(HomeCell.self, forCellReuseIdentifier:HomeCell.useIdentifier())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:: Selectors
    
    @objc private func didTapAddNotesButton() {
        let addNotesViewController = AddNotesViewController()
        self.navigationController?.pushViewController(addNotesViewController, animated: true)
    }
    
    @objc private func didTapLogoutButton() {}
    
    func fetchNotes() {
        self.myView.showLoadingViewWithMessage(message: Constants.fetchNotesCaption)
        NotesActionsDataCenter.sharedInstance.fetchNotes { (result) in
            self.myView.hideLoadingView()
            switch result
            {
            case .Success(let notes):
                self.dataSource = notes
                break
            case .Failure(let error):
                print(error!)
                break
            }
        }
    }
    
    // MARK:: TableView Delegate Functions
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let homeCell = self.tableView(tableView, cellForRowAt: indexPath) as! HomeCell
        return homeCell.getHeight()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: HomeCell.useIdentifier()) as! HomeCell
        let data = self.dataSource[indexPath.row] as Data
        homeCell.populateValues(model: data)
        return homeCell
    }
    
}
