//
//  SettingsViewController.swift
//  Tips
//
//  Created by Douglas on 12/14/15.
//  Copyright © 2015 Dougli. All rights reserved.
//

import UIKit

protocol TipDelegate{
    func customTip(newTip:Double)
    
    func selection(option: Int) //Leaving parameter for possible expansions
}

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   var delegate: TipDelegate? = nil
    
   struct Keys{
        static let Name = "Name"
        static let Description = "Description"
    }

    /* Dictionary for our table cells*/
    var tipDictionary: [[String : AnyObject]] = [
        [Keys.Name: "viewDidLoad() did not get called", Keys.Description: ""]
    ]
    var tip1: String = ""
    var tip2: String = ""
    var tip3: String = ""
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        /* Create a custom back button so we can have delegation interaction*/
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Save & Back", style: UIBarButtonItemStyle.Done, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;
        /* Populate our dictionary with information we receive from our VC */
        tipDictionary =  [
            [Keys.Name: "Tip #1", Keys.Description: tip1],
            [Keys.Name: "Tip #2", Keys.Description: tip2],
            [Keys.Name: "Tip #3", Keys.Description: tip3],
            [Keys.Name: "Custom", Keys.Description: "Click here to customize a tip value"]
        ]
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")! 
        let dictionary = tipDictionary[indexPath.row]
        
        cell.textLabel!.text = dictionary[Keys.Name] as? String
        cell.detailTextLabel!.text = dictionary[Keys.Description] as? String
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Choose Default Tip or Customize Your Own"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //# of rows
        
        return tipDictionary.count
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        
        /* First 3 , noncustomized rows selected */
        if( indexPath.row < 3){
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(indexPath.row, forKey: "selected")
            defaults.synchronize()

        }
        else{
            /* We still follow normal logic and set int to 3 so we know if user set a custom value */
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(3, forKey: "selected")
            defaults.synchronize()
            
            /*Segway to 3rd VC */
            performSegueWithIdentifier("cusSeg", sender: self)

            
        }
    }
    
    
    func back(sender: UIBarButtonItem) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let optionSelect = defaults.integerForKey("selected")
        if(optionSelect == 3){
            if (delegate != nil){
                let cusTip = defaults.doubleForKey("customTip")
                
                /* Set the default selection to the last one now */
                defaults.setInteger(2, forKey: "selected")
                delegate!.customTip(cusTip)
            }
        }
        else if(optionSelect < 3){
            if(delegate != nil){
                delegate!.selection(optionSelect)
            }
        }
        else{
            print("else block called, nothing fancy should happen")
        }
        self.navigationController?.popViewControllerAnimated(true)
    }

}
