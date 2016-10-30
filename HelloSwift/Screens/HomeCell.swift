//
//  HomeCell.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 30/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    var titleLabel: UILabel?
    var bodyTextView: UITextView?
    var createdAt: UILabel?
    
    let topInset: CGFloat = 5.0
    let leftInset: CGFloat = 20.0
    let dummyHeight: CGFloat = 40.0
    var availableWidth: CGFloat?
    let padding: CGFloat = 20.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
           self.createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func populateValues(model:Data) {
        let createdAtDoubleValue = Double(model.created!)
        let createdAtDate = NSDate(timeIntervalSince1970:createdAtDoubleValue/1000.0)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        self.createdAt?.text = formatter.string(from: createdAtDate as Date)
        self.titleLabel?.text = model.title
        self.bodyTextView?.text = model.body
        
        self.createdAt?.sizeToFit()
        self.createdAt?.frame = CGRect(x:leftInset, y:topInset, width:availableWidth!, height:(self.titleLabel?.frame.height)!)
        
        self.titleLabel?.sizeToFit()
        self.titleLabel?.frame = CGRect(x:leftInset, y:(self.createdAt?.frame.maxY)!+padding, width:availableWidth!, height:((self.titleLabel?.frame.height)!))
        
        self.bodyTextView?.sizeToFit()
        self.bodyTextView?.frame = CGRect(x:leftInset, y:(self.titleLabel?.frame.maxY)!+padding, width:availableWidth!, height:((self.bodyTextView?.frame.height)!))
    }
    
    func getHeight() -> CGFloat {
        let createdAtHeight = self.topInset + (self.createdAt?.frame.height)! + padding
        let titleHeight = (self.titleLabel?.frame.height)! + padding
        let bodyHeight = (self.titleLabel?.frame.height)! + padding
        return createdAtHeight + titleHeight + bodyHeight
    }
    
    // MARK:: Private Functions
    private func createViews() {
      self.availableWidth = UIScreen.main.bounds.width - (2*leftInset)

        self.createdAt = UILabel.init(frame: CGRect(x:leftInset, y:topInset, width:availableWidth!, height:dummyHeight))
        self.createdAt?.font = UIFont.systemFont(ofSize: 13)
        self.createdAt?.textAlignment = .right
        self.addSubview(self.createdAt!)
        
        self.titleLabel = UILabel.init(frame: CGRect(x:leftInset, y:topInset, width:availableWidth!+20, height:dummyHeight))
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.titleLabel?.textColor = .blue
        self.addSubview(self.titleLabel!)

        self.bodyTextView = UITextView.init(frame: CGRect(x:leftInset, y:(self.titleLabel?.frame.maxY)!+20, width:availableWidth!, height:dummyHeight))
        self.bodyTextView?.font = UIFont.systemFont(ofSize: 17)
        self.bodyTextView?.textColor = .black
        self.addSubview(self.bodyTextView!)
    }
    
    
    // MARK:: Class Methods
   class public func useIdentifier() -> String {
        return "homeCellIdentifier"
    }

}
