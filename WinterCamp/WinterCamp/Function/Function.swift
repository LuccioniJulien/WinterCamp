//
//  Function.swift
//  WinterCamp
//
//  Created by Julien Luccioni on 15/02/2018.
//  Copyright © 2018 Julien Luccioni. All rights reserved.
//

import Foundation
import UIKit

func highlightSelectedTextField(textfield: UITextField){
    //focus rouge sur un textfield
    textfield.layer.borderColor = UIColor.red.cgColor
    textfield.layer.borderWidth = 1
    textfield.layer.cornerRadius = 5
}

func resetSelectedTextField(textfield: UITextField){
    //reset l'apparence des textfields
    textfield.layer.borderColor = UIColor.clear.cgColor
    textfield.layer.borderWidth = 1
    textfield.layer.cornerRadius = 5
}

func isBlank(tf: [UITextField])->Bool{
    //verification qu'il y a bien une saisie
    var flag:Bool=false
    var array:[Bool]=[]
    var oneIsBlank:Bool=false
    for textfield in tf {
        resetSelectedTextField(textfield: textfield)
        flag=(textfield.text == "")
        if (flag){
            array.append(flag)
            highlightSelectedTextField(textfield:textfield)
            shake(sender:textfield)
        }
    }
    for bool in array {
        if(bool){
            oneIsBlank=true
            break
        }
    }
    return oneIsBlank
}

func shake(sender:UITextField){
    //animation
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = 0.07
    animation.repeatCount = 4
    animation.autoreverses = true
    animation.fromValue = NSValue(cgPoint: CGPoint(x: sender.center.x - 10, y: sender.center.y))
    animation.toValue = NSValue(cgPoint: CGPoint(x: sender.center.x + 10, y: sender.center.y))
    sender.layer.add(animation, forKey: "position")
}
