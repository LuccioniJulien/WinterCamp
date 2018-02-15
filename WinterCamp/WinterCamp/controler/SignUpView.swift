//
//  SignUpView.swift
//  WinterCamp
//
//  Created by SheyZen on 15/02/2018.
//  Copyright © 2018 Julien Luccioni. All rights reserved.
//

import UIKit

class SignUpView: UIView {

    @IBOutlet var passwordConfirmText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var emailText: UITextField!
    @IBOutlet var contentView: UIView!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var backToLoginButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SignUpView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
