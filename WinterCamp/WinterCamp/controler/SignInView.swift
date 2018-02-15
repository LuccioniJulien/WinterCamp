//
//  SignInView.swift
//  WinterCamp
//
//  Created by SheyZen on 15/02/2018.
//  Copyright © 2018 Julien Luccioni. All rights reserved.
//

import UIKit

class SignInView: UIView {

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var signUpDelegate:SignUpViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SignInView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    @IBAction func loginClick(_ sender: Any) {
        if(User.StaticUser?._mail==""){
            print("Please register first")
            return
        }
        
        if emailText.text == User.StaticUser?._mail && passwordText.text == User.StaticUser?._password {
            emailText.text = ""
            passwordText.text = ""
            print("good I.D, welcome \(User.StaticUser!._mail)")
        } else {
             print("Unable to find a match with this pair of email / password“")
        }
        
    }
    
    @IBAction func registerClick(_ sender: Any) {
        
        self.isHidden = true
        signUpDelegate?.SignUpView()
    }
    
}
