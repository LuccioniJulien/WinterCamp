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
    
    @IBOutlet var signInDelegate:SignInViewDelegate!
    
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
    
    @IBAction func signUpClick(_ sender: Any) {
        if emailText.text == "" || passwordText.text == "" || passwordConfirmText.text == "" {
            print("nil is bad")
            return
        }
        if(!isValidEmail(testStr:emailText.text!)){
            print("bad mail")
            return
        }
        if (passwordText.text == passwordConfirmText.text){
        User.StaticUser?.setUser(mail: emailText.text!, password: passwordText.text!)
        print(User.StaticUser?._mail)
        print(User.StaticUser?._password)
        }
    }
    @IBAction func goToLoginClick(_ sender: Any) {
        self.isHidden = true
        signInDelegate?.SignInView()
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
}

