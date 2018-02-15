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
        contentSignIn.isHidden = false
    }
    
    func SignUpView(){
       contentSignUp.isHidden = false
    }
}

