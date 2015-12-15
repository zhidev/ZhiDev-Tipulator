//
//  ViewController.swift
//  Tips
//
//  Created by Douglas on 12/14/15.
//  Copyright © 2015 Dougli. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  TipDelegate{

    @IBOutlet var billField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipControl: UISegmentedControl!
    
    var tip1:Double = 0.18
    var tip2:Double = 0.2
    var tip3:Double = 0.22
    
    var moneyDelegate: moneyTextDelegate! 
    
    var tipPercentages = [0.18, 0.2, 0.22]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        moneyDelegate = moneyTextDelegate()
        billField.delegate = moneyDelegate
        
        
        /* select is the default value user set so we will select it be default */
        let defaults = NSUserDefaults.standardUserDefaults()
        let select = defaults.integerForKey("selected")
        tipControl.selectedSegmentIndex = select
        
        let custV = defaults.doubleForKey("customTip") * 100
        if(custV > 0.0 ){
            tip3 = custV
            tipControl.setTitle( "\(custV)%", forSegmentAtIndex: 2)
        }
        
        tipPercentages = [tip1, tip2, tip3]

    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var StoDouble = billField.text!
        StoDouble = String(StoDouble.characters.dropFirst())
        let billAmount = NSString(string: StoDouble).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {


        if segue.identifier == "settingSeque"{
            let controller = segue.destinationViewController as! SettingsViewController
            /* Pass in tip values so our settings knows about it*/
            var passIn: Double = tip1 * 100
            controller.tip1 = String( "\(passIn)%")
            passIn = tip2 * 100
            controller.tip2 = String( "\(passIn)%")
            passIn = tip3 * 100
            controller.tip3 = String( "\(passIn)%")
            
            /* Make our delegate */
            controller.delegate = self
            controller.viewDidLoad()
        }
        
        if segue.identifier == "emailSegue"{
            let controller = segue.destinationViewController as! emailViewController
            let defaults = NSUserDefaults.standardUserDefaults()
            let select = defaults.integerForKey("selected")
            /* Pass in string values for our email*/
            controller.bill = billField.text!
            controller.tip = tipLabel.text!
            controller.total = totalLabel.text!
            controller.gratuity = tipControl.titleForSegmentAtIndex(select)

        }
    }
    
    
    func customTip(newTip: Double) {
        tip3 = newTip
        let newSeg = newTip * 100

        /* Change segment control properly */
        tipControl.setTitle( "\(newSeg)%", forSegmentAtIndex: 2)
        viewDidLoad()
    }
    
    func selection(option: Int) {
        viewDidLoad()
    }

}

