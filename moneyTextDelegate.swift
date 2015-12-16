//
//  moneyTextDelegate.swift
//  Zhi's Tips
//
//  Created by Douglas on 12/14/15.
//  Copyright © 2015 Dougli. All rights reserved.
//

import UIKit

class moneyTextDelegate: NSObject, UITextFieldDelegate {
    
    var newText = ""
    /* Format our string to be currency like */
    func moneyFormat(str:String) -> String{
        var num = 0.0
        
        num = (str as NSString).doubleValue
        
        num = num / 100
        let numStr = NSString(format:"$%.2f", num)
        return numStr as String
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        /* case for "backspace" button */
        if string.hash == 0 && newText.characters.count > 0{
            newText = String(newText.characters.dropLast())
            var new = moneyFormat(newText)
            new = new + "z"
            textField.text = new
            return true
        }
        /* Normal Ints */
        else if Int(string) != nil{
            newText = newText + string
            var new = moneyFormat(newText)
            new = String(new.characters.dropLast())
            textField.text = new
            return true
        }
        /* Not an Int */
        else{
            return false
        }
    }
    
}
