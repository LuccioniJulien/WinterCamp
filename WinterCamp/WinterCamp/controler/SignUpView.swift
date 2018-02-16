//
//  SignUpView.swift
//  WinterCamp
//
//  Created by SheyZen on 15/02/2018.
//  Copyright © 2018 Julien Luccioni. All rights reserved.
//

import UIKit
import Toast_Swift

class SignUpView: UIView {

    @IBOutlet var passwordConfirmText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var emailText: UITextField!
    @IBOutlet var contentView: UIView!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var backToLoginButton: UIButton!
    
    var signInDelegate:SignInViewDelegate!
    
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
        if isBlank(tf: [emailText,passwordText,passwordConfirmText]) {
            self.contentView.makeToast("Email or password blank")
            print("Email or password blank")
            return
        }
        
        if(!isValidEmail(tf:emailText)){
            self.contentView.makeToast("Email invalid")
            print("Email invalid")
            return
        }
        if (checkPass(password: passwordText,confirm: passwordConfirmText)){
            let theUser:User = User(mail:emailText.text!,password:passwordText.text!)
            StaticUser.user = theUser
            //print("User : \(User.StaticUser!._mail)")
            //print("Pass : \(User.StaticUser!._password)")
            passwordText.text = ""
            passwordConfirmText.text=""
            emailText.text = ""
             self.contentView.makeToast("Successful sign up")
        }
    }
    @IBAction func goToLoginClick(_ sender: Any) {
        self.isHidden = true
        signInDelegate?.SignInView()
    }
    
    func isValidEmail(tf:UITextField) -> Bool {
        //verifie si l'email match bien le regex
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let flag:Bool=emailTest.evaluate(with: tf.text)
        if (!flag){
            highlightSelectedTextField(textfield:tf)
            shake(sender:tf)
        }
        else{
            resetSelectedTextField(textfield:tf)
        }
        return flag
    }
    
    func checkPass(password: UITextField,confirm: UITextField)->Bool{
        //verification des mots de passe
        let flag:Bool=(password.text==confirm.text)
        if (!flag){
            self.contentView.makeToast("Password invalid")
            highlightSelectedTextField(textfield:passwordText)
            highlightSelectedTextField(textfield:passwordConfirmText)
            shake(sender:passwordText)
            shake(sender:passwordConfirmText)
            print("Password invalid")
        }
        return flag
    }

}

