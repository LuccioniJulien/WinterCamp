//
//  User.swift
//  WinterCamp
//
//  Created by Julien Luccioni on 15/02/2018.
//  Copyright © 2018 Julien Luccioni. All rights reserved.
//

class User {
    var _mail:String = ""
    var _password:String = ""
    static let StaticUser:User? = User()
    
    func setUser(mail:String,password:String){
        _mail = mail
        _password = password
    }

}
