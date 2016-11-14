//
//  ALHudView.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 31/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

class ALHudView: UIView {
    open var lblErrorMessage: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func createViews() {
        self.lblErrorMessage = UILabel()
        self.lblErrorMessage?.textAlignment = .center
        self.lblErrorMessage?.textColor = .white
        self.lblErrorMessage?.font = .appThemeRegularFontWithSize(12)
        self.addSubview(self.lblErrorMessage!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.lblErrorMessage?.frame = self.bounds
    }
    
}
