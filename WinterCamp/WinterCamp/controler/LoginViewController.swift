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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    func SignInView(){
        // Permet de faire apparaitre SignInView
        // contentSignIn.emailText.text = User.StaticUser?._mail
        // contentSignIn.passwordText.text = User.StaticUser?._password
        resetSelectedTextField(textfield:contentSignIn.emailText)
        resetSelectedTextField(textfield:contentSignIn.passwordText)
        contentSignIn.isHidden = false
    }
    
    func SignUpView(){
        // Permet de faire apparaitre SignUpView
        resetSelectedTextField(textfield:contentSignUp.emailText)
        resetSelectedTextField(textfield:contentSignUp.passwordText)
        resetSelectedTextField(textfield:contentSignUp.passwordConfirmText)
        contentSignUp.isHidden = false
    }
    
    
}

