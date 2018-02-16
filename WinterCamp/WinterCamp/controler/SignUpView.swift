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
        //clique du bouton SignUp
        if isBlank(tf: [emailText,passwordText,passwordConfirmText]) {
            self.contentView.makeToast("Email or password blank", position: .top)
            print("Email or password blank")
            return
        }
        
        if(!isValidEmail(tf:emailText)){
            self.contentView.makeToast("Email invalid", position: .top)
            print("Email invalid")
            return
        }
        
        if (!isPasswordValid(passwordText)) {
            self.contentView.makeToast("Password need to have at least 8 caracters, 1 uppercase, 1 number", position: .top)
            highlightSelectedTextField(textfield: passwordConfirmText)
            shake(sender: passwordConfirmText)
            return
        }
        
        if (checkPass(password: passwordText,confirm: passwordConfirmText)){
            let theUser:User = User(mail:emailText.text!,password:passwordText.text!)
            StaticUser.instance?.user = theUser
            passwordText.text = ""
            passwordConfirmText.text=""
            emailText.text = ""
            self.contentView.makeToast("Successful sign up", position: .top)
        }
    }
    
    @IBAction func goToLoginClick(_ sender: Any) {
        //Cache SignUp et fait apparaitre SignIn
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
        //verification de la confirmation de mot de passe
        let flag:Bool=(password.text==confirm.text)
        if (!flag){
            self.contentView.makeToast("Password confirmation doesn't match", position: .top)
            highlightSelectedTextField(textfield:passwordText)
            highlightSelectedTextField(textfield:passwordConfirmText)
            shake(sender:passwordText)
            shake(sender:passwordConfirmText)
            print("Password confirmation doesn't match")
        }
        return flag
    }
    
    func isPasswordValid(_ password : UITextField) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()-_=+{}|?>.<,:;~`’]{8,}$")
        let flag: Bool = passwordTest.evaluate(with: password.text)
        if (!flag) {
            highlightSelectedTextField(textfield:password)
            shake(sender:password)
        }
        else{
            resetSelectedTextField(textfield:password)
        }
        return flag
    }
}

