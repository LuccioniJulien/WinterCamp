//
//  StaticUser.swift
//  WinterCamp
//
//  Created by Julien Luccioni on 16/02/2018.
//  Copyright © 2018 Julien Luccioni. All rights reserved.
//

import Foundation

class StaticUser {
    static let instance:StaticUser? = StaticUser()
    var user:User?=nil
    
    private init(){}
}
