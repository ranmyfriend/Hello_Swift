//
//  ALLoadingView.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 31/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

class ALLoadingView: UIView {
    
    public var lblLoadingMessage: UILabel?
    
    private var indicator: DGActivityIndicatorView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = 100
        
        self.indicator?.frame = CGRect(x:self.bounds.width/2-size/2, y:self.bounds.height/2-size/2, width:size, height:60);
        let labelSize = self.lblLoadingMessage?.sizeThatFits(CGSize(width:self.bounds.width-20, height:CGFloat.greatestFiniteMagnitude))
        
        self.lblLoadingMessage?.frame = CGRect(x:10, y:(self.indicator?.frame.maxY)!+10, width:self.bounds.width-20, height:(labelSize?.height)!)
    }
    
    // MARK:: Private Functions
    private func createViews() {
        
        self.indicator = DGActivityIndicatorView.init(type: .ballPulse, tintColor: UIColor.rgb(fromHex: 0x5ABD3B), size: 80)
        self.indicator?.backgroundColor = .clear
        self.addSubview(self.indicator!)
        
        self.lblLoadingMessage = UILabel()
        self.lblLoadingMessage?.text = ""
        self.lblLoadingMessage?.textColor = .white
        self.lblLoadingMessage?.textAlignment = .center
        self.lblLoadingMessage?.font = .appThemeRegularFontWithSize(size: 14)
        self.lblLoadingMessage?.backgroundColor = .clear
        self.lblLoadingMessage?.numberOfLines = 0
        self.addSubview(self.lblLoadingMessage!)
        
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    // MARK:: Public Functions
    public func startAnimatingLoader() {
        self.indicator?.startAnimating()
    }
    
    public func stopAnimatingLoader() {
        self.indicator?.stopAnimating()
    }

}
