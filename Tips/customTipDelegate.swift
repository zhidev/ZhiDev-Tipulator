//
//  customTipDelegate.swift
//  Tips
//
//  Created by Douglas on 12/15/15.
//  Copyright © 2015 Dougli. All rights reserved.
//

import UIKit

class customTipDelegate: NSObject, UITextFieldDelegate {
    var decCounter = 0
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if string.hash == 0 {
            
            return true
        }
        else if Int(string) != nil{
            return true
        }
        else if(string == "."){
            if (decCounter == 0) {
                decCounter++
                return true
            }
            else{
                return false
            }
        }
        else{
            return false
        }
    }
}
