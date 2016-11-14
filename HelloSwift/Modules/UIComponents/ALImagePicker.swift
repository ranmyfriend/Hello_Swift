//
//  ALImagePicker.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 31/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

import UIKit

protocol ImagePickerProtocol {
    func showImagePickerController()
    func showCameraController()
    func didCancelImagePickerAction()
}

class ALImagePicker: UIView {
    open var delegate: ImagePickerProtocol?

    fileprivate var bgView: UIView?
    fileprivate var btnTakePhoto: UIButton?
    fileprivate var btnCameraRoll: UIButton?
    fileprivate var btnCancel: UIButton?
    fileprivate var resignControl: UIControl?

    override init(frame:CGRect) {
        super.init(frame: frame)
        self.createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.resignControl?.frame = self.bounds
        self.bgView?.frame = CGRect(x:40, y:self.bounds.height-220, width:self.bounds.width-80, height:200)
        
        let topInset: CGFloat = 20.0
        let leftInset: CGFloat = 15.0
        let gap: CGFloat = 10.0
        let availableWidth: CGFloat = (self.bgView?.bounds.width)! - (2*leftInset)
        let height = ((self.bgView?.bounds.height)!-(2*gap)-(2*topInset))/3

        self.btnTakePhoto?.frame = CGRect(x:leftInset, y:topInset, width:availableWidth, height:height)
        self.btnCameraRoll?.frame = CGRect(x:leftInset, y:(self.btnTakePhoto?.bounds.maxY)!+gap, width:availableWidth, height:height)
        self.btnCancel?.frame = CGRect(x:leftInset, y:(self.btnCameraRoll?.bounds.maxY)!+gap, width:availableWidth, height:height)
    }
    
    
    // MARK:: Public Functions
    open func animateAndShow() {
        self.bgView?.frame = CGRect(x:(self.bgView?.frame.minX)!, y:Constants.SCREEN_HEIGHT, width:(self.bgView?.frame.width)!, height:(self.bgView?.frame.height)!)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveLinear, animations: { 
            self.bgView?.frame = CGRect(x:(self.bgView?.frame.minX)!, y:self.bounds.height-220, width:(self.bgView?.frame.width)!, height:(self.bgView?.frame.height)!)
            }) { (finished) in }
    }
    
    open func animateAndHide() {
        self.bgView?.frame = CGRect(x:(self.bgView?.frame.minX)!, y:Constants.SCREEN_HEIGHT-200, width:(self.bgView?.frame.width)!, height:(self.bgView?.frame.height)!)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveLinear, animations: {
            self.bgView?.frame = CGRect(x:(self.bgView?.frame.minX)!, y:self.bounds.height, width:(self.bgView?.frame.width)!, height:(self.bgView?.frame.height)!)
        }) { (finished) in self.removeFromSuperview()}

    }
    
    // MARK:: Private Functions
    fileprivate func createViews() {
        
        self.backgroundColor = UIColor.rgba(0x000000, alpha: 0.3)
        self.resignControl = UIControl()
        self.resignControl?.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        self.addSubview(self.resignControl!)
        
        self.bgView = UIView()
        self.bgView?.backgroundColor = .white
        self.bgView?.layer.cornerRadius = 3.0
        self.addSubview(self.bgView!)
        
        self.btnTakePhoto = UIButton()
        self.btnTakePhoto?.backgroundColor = .clear
        self.btnTakePhoto?.setTitle("Take Photo", for: .normal)
        self.btnTakePhoto?.setTitleColor(UIColor.rgb(0x9b9b9b), for: .normal)
        self.btnTakePhoto?.titleLabel?.font = UIFont.appThemeRegularFontWithSize(18)
        self.btnTakePhoto?.addTarget(self, action: #selector(didTapTakePhotoButton), for: .touchUpInside)
        self.btnTakePhoto?.layer.borderWidth = 1.0
        self.btnTakePhoto?.layer.borderColor = UIColor.rgb(0x979797).cgColor
        self.bgView?.addSubview(self.btnTakePhoto!)

        self.btnCameraRoll = UIButton()
        self.btnCameraRoll?.backgroundColor = .clear
        self.btnCameraRoll?.setTitle("Camera Roll", for: .normal)
        self.btnCameraRoll?.setTitleColor(UIColor.rgb(0x9b9b9b), for: .normal)
        self.btnCameraRoll?.titleLabel?.font = UIFont.appThemeRegularFontWithSize(18)
        self.btnCameraRoll?.addTarget(self, action: #selector(didTapCameraRollButton), for: .touchUpInside)
        self.btnCameraRoll?.layer.borderWidth = 1.0
        self.btnCameraRoll?.layer.borderColor = UIColor.rgb(0x979797).cgColor
        self.bgView?.addSubview(self.btnCameraRoll!)
        
        self.btnCancel = UIButton()
        self.btnCancel?.backgroundColor = UIColor.rgb(0xf5f5f5)
        self.btnCancel?.setTitle("Cancel", for: .normal)
        self.btnCancel?.setTitleColor(UIColor.rgb(0x9b9b9b), for: .normal)
        self.btnCancel?.titleLabel?.font = UIFont.appThemeRegularFontWithSize(18)
        self.btnCancel?.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        self.btnCancel?.layer.borderWidth = 1.0
        self.btnCancel?.layer.borderColor = UIColor.rgb(0x979797).cgColor
        self.bgView?.addSubview(self.btnCancel!)
        
    }
    
    @objc fileprivate func didTapCancelButton() {
        self.delegate?.didCancelImagePickerAction();
        self.animateAndHide()
    }
    
    @objc fileprivate func didTapTakePhotoButton() {
        self.delegate?.showCameraController();
        self.animateAndHide()
    }
    
    @objc fileprivate func didTapCameraRollButton() {
        self.delegate?.showImagePickerController();
        self.animateAndHide()
    }
    
}
