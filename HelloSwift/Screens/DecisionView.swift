//
//  DecisionView.swift
//  HelloSwift
//
//  Created by Ranjith Kumar on 25/10/2016.
//  Copyright © 2016 Ranjith Kumar. All rights reserved.
//

protocol DecisionViewProtocol : class {
    func didTapLoginButton()
    func didTapSignupButton()
}

class DecisionView: BaseView {
    
    weak var delegate: DecisionViewProtocol?
    
    var loginButton: UIButton?
    var signupButton: UIButton?
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews() {

        self.backgroundColor = .white
        
        self.loginButton = UIButton()
        self.loginButton?.backgroundColor = .red
        self.loginButton?.setTitle("User -> Login", for: .normal)
        self.loginButton?.setTitleColor(.white, for: .normal)
        self.loginButton?.titleLabel?.font = .boldSystemFont(ofSize: 17)
        self.loginButton?.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        self.loginButton?.titleLabel?.textAlignment = .center
        self.addSubview(self.loginButton!)
        
        self.signupButton = UIButton()
        self.signupButton?.backgroundColor = .red
        self.signupButton?.setTitle("User -> Signup", for: .normal)
        self.signupButton?.setTitleColor(.white, for: .normal)
        self.signupButton?.titleLabel?.font = .boldSystemFont(ofSize: 17)
        self.signupButton?.addTarget(self, action: #selector(didTapSignupButton), for: .touchUpInside)
        self.signupButton?.titleLabel?.textAlignment = .center
        self.addSubview(self.signupButton!)
    }
    
    override func layoutSubviews() {
        let topInset :CGFloat = 100.0
        let leftInset :CGFloat = 20.0
        let height :CGFloat = 40.0
        let availableWidth = self.bounds.size.width - (2*leftInset)
        
        self.loginButton?.frame = CGRect(x:leftInset, y:topInset, width:availableWidth, height:height)
        self.loginButton?.layer.cornerRadius = 4.0
        
        self.signupButton?.frame = CGRect(x:leftInset, y:(((self.loginButton?.frame)?.maxY)!+20), width:availableWidth, height:height)
        self.signupButton?.layer.cornerRadius = 4.0
    }
    
    // MARK:: Selectors
    
    func didTapLoginButton() {
        self.delegate?.didTapLoginButton()
    }
    
    func didTapSignupButton() {
        self.delegate?.didTapSignupButton()
    }

}
