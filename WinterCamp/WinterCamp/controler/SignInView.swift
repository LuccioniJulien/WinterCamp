//
//  SignInView.swift
//  WinterCamp
//
//  Created by SheyZen on 15/02/2018.
//  Copyright © 2018 Julien Luccioni. All rights reserved.
//

import UIKit
import Toast_Swift

class SignInView: UIView {

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var contentView: UIView!
    
    var signUpDelegate:SignUpViewDelegate?
    
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
        //clique du bouton SignIn et vérification des champs
        if(StaticUser.instance?.user == nil){
            self.contentView.makeToast("Please register first", position: .top)
            print("Please register first")
            return
        }
        
        if isBlank(tf: [emailText,passwordText]) {
            self.contentView.makeToast("Email or password blank", position: .top)
            print("Email or password blank")
            return
        }
        
        if emailText.text == StaticUser.instance?.user?._mail && passwordText.text == StaticUser.instance?.user?._password {
            emailText.text = ""
            passwordText.text = ""
            self.contentView.makeToast("Successful login", position: .top)
        } else {
            highlightSelectedTextField(textfield:emailText)
            shake(sender:emailText)
            highlightSelectedTextField(textfield:passwordText)
            shake(sender:passwordText)
            self.contentView.makeToast("Unable to find a match with this pair of email / password", position: .top)
            print("Unable to find a match with this pair of email / password")
        }
    }
    
    @IBAction func registerClick(_ sender: Any) {
        //Cache SignIn et fait apparaitre SignUp 
        self.isHidden = true
        signUpDelegate?.SignUpView()
    }
    
}
