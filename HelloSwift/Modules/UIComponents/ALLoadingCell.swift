//
//  ALLoadingCell.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 31/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

let kCircleOutThicknessRatio:CGFloat = 0.2
let kCircleInThicknessRatio:CGFloat = 0.25

class ALLoadingCell: UITableViewCell {
    
    private var circleViewOut: DACircularProgressView?
    private var circleViewIn: DACircularProgressView?
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let outCircleSize = self.bounds.height * 0.5
        let inCircleSize = self.bounds.height * 0.3
        
        var circleFrame = CGRect(x:self.frame.width-outCircleSize/2, y:self.frame.height-outCircleSize/2, width:outCircleSize, height:outCircleSize)
        
        if(UIScreen.main.scale == 1.0) {
            circleFrame = circleFrame.integral
            self.circleViewOut?.frame = circleFrame
        }
        
        circleFrame = CGRect(x:self.frame.width-inCircleSize/2, y:self.frame.size.height-inCircleSize/2, width:inCircleSize, height:inCircleSize)
        
        if(UIScreen.main.scale == 1.0) {
            circleFrame = circleFrame.integral
            self.circleViewIn?.frame = circleFrame
        }
    }
    
    override func removeFromSuperview() {
        
        super.removeFromSuperview()
        self.stopAnimatingCell()
        super.removeFromSuperview()
        
    }
    
    // MARK:: Public Functions
    
    class public func reuseIdentifier() -> String {
        return "LoadingCell"
    }
    
    // MARK:: Private Functions
    
    private func createViews() {
        self.backgroundColor = .white
        
        self.circleViewOut = DACircularProgressView()
        self.circleViewOut?.backgroundColor = .clear
        self.circleViewOut?.trackTintColor = .clear
        self.circleViewOut?.progressTintColor = .green
        self.circleViewOut?.roundedCorners = 3
        self.circleViewOut?.setProgress(0.0, animated: false)
        self.circleViewOut?.alpha = 1.0
        self.circleViewOut?.layer.anchorPoint = CGPoint(x:0.5, y:0.5)
        self.circleViewOut?.thicknessRatio = kCircleOutThicknessRatio
        self.addSubview(self.circleViewOut!)
        
        self.circleViewIn = DACircularProgressView()
        self.circleViewIn?.backgroundColor = .clear
        self.circleViewIn?.trackTintColor = .clear
        self.circleViewIn?.progressTintColor = .green
        self.circleViewIn?.roundedCorners = 3
        self.circleViewIn?.setProgress(0.0, animated: false)
        self.circleViewIn?.alpha = 1.0
        self.circleViewIn?.layer.anchorPoint = CGPoint(x:0.5, y:0.5)
        self.circleViewIn?.transform = (circleViewIn?.transform)!.scaledBy(x: -1, y: 1)
        self.circleViewIn?.thicknessRatio = kCircleInThicknessRatio
        self.addSubview(self.circleViewIn!)
        
        self.circleViewOut?.setProgress(0.9, animated: false)
        self.circleViewIn?.setProgress(0.9, animated: false)
    }
    
    private func statAnimatingCell() {
        if(!(self.circleViewOut?.layer.animationKeys()?.contains("rotationAnimation"))!) {
            let multiplier: Double = 1000000.0
            let duration: TimeInterval = TimeInterval(multiplier)
            let rotations: Double = 1.0 * multiplier
            
            let value: Double = (M_PI * 2.0 * rotations)
            
            var rotationAnimation: CABasicAnimation?
            rotationAnimation?.mutableSetValue(forKeyPath:"transform.rotation.z")
            rotationAnimation?.duration = duration
            rotationAnimation?.isCumulative = true
            rotationAnimation?.repeatCount = 1
            
            rotationAnimation?.toValue = value
            self.circleViewOut?.layer.add(rotationAnimation!, forKey: "rotationAnimation")
            
            rotationAnimation?.toValue = -value
            self.circleViewIn?.layer.add(rotationAnimation!, forKey: "rotationAnimation")
            
        }
    }
    
    private func stopAnimatingCell() {
        self.circleViewOut?.layer.removeAllAnimations()
        self.circleViewIn?.layer.removeAllAnimations()
    }

}
