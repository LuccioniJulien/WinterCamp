//
//  ViewController.swift
//  WinterCamp
//
//  Created by Julien Luccioni on 15/02/2018.
//  Copyright © 2018 Julien Luccioni. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,SignInViewDelegate,SignUpViewDelegate {

    
    @IBOutlet weak var contentSignUp: SignUpView!
    @IBOutlet weak var contentSignIn: SignInView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        contentSignUp.signInDelegate = self
        contentSignIn.signUpDelegate = self
        contentSignUp.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    func SignInView(){
        //reset des animations et highlight
        resetSelectedTextField(textfield:contentSignIn.emailText)
        resetSelectedTextField(textfield:contentSignIn.passwordText)
        contentSignIn.emailText.text = ""
        contentSignIn.passwordText.text = ""
        // Permet de faire apparaitre SignInView
        contentSignIn.isHidden = false
    }
    
    func SignUpView(){
        //reset des animations et highlight
        resetSelectedTextField(textfield:contentSignUp.emailText)
        resetSelectedTextField(textfield:contentSignUp.passwordText)
        resetSelectedTextField(textfield:contentSignUp.passwordConfirmText)
        contentSignUp.emailText.text = ""
        contentSignUp.passwordText.text = ""
        contentSignUp.passwordConfirmText.text = ""
        // Permet de faire apparaitre SignUpView
        contentSignUp.isHidden = false
    }
    
    
}

