//
//  CustomViewController.swift
//  Zhi's Tips
//
//  Created by Douglas on 12/14/15.
//  Copyright © 2015 Dougli. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {

    @IBOutlet var custAmount: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    var textDelegate: customTipDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textDelegate = customTipDelegate()
        custAmount.delegate = textDelegate

    }

    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let colors = defaults.integerForKey("colors")
        themeChange(colors)
    }
    
    @IBAction func saveExit(sender: AnyObject) {
        /* Get our custom tip % , P for percent haha... ha */
        var tiP = NSString(string: custAmount.text!).doubleValue
        /* Adjust it to a fraction of a number to keep syntax in other VCs*/
        tiP = tiP / 100
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tiP, forKey: "customTip")
        defaults.synchronize()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func themeChange(value: Int){
        if(value == 0){
            self.view.backgroundColor = UIColor.cyanColor()
        }
        else if (value == 1){
            self.view.backgroundColor = UIColor.blackColor()
            
        }
        
    }

}
