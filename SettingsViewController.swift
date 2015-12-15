//
//  SettingsViewController.swift
//  Tips
//
//  Created by Douglas on 12/14/15.
//  Copyright © 2015 Dougli. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   struct Keys{ //the static is so we can use the instance of this struct without creating one
        static let Name = "Name"
        static let Description = "Description"
    }
    
    /*
    //let animalNames = ["Snake", "Racoon", "Penguin", "Other animal names"]
    var colorDictionaries: [[String : AnyObject]] = [
        [Keys.Name: "Red", Keys.Description: "Color of Fire!", Keys.Color: UIColor.redColor()],
        [Keys.Name: "Blue", Keys.Description: "Color of Water!", Keys.Color: UIColor.blueColor()],
        [Keys.Name: "Green", Keys.Description: "Color of Green!", Keys.Color: UIColor.greenColor()],
        [Keys.Name: "Orange", Keys.Description: "Color of the sun!", Keys.Color: UIColor.orangeColor()],
        [Keys.Name: "Yellow", Keys.Description: "Color of lemons!", Keys.Color: UIColor.yellowColor()]
    ]
*/
    var tipDictionary: [[String : AnyObject]] = [
        [Keys.Name: "Tip #1", Keys.Description: ""],
        [Keys.Name: "Tip #2", Keys.Description: ""],
        [Keys.Name: "Tip #3", Keys.Description: ""]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")! //as! UITableViewCell
        let dictionary = tipDictionary[indexPath.row]
        
        cell.textLabel!.text = dictionary[Keys.Name] as? String
        cell.detailTextLabel!.text = dictionary[Keys.Description] as? String
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Edit Tips"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //# of rows
        //return animalNames.count
        
        return 3
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    /*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    print("Selected row \(indexPath.row)")
    
    colorDictionaries.removeAtIndex(indexPath.row)
    
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
    }*/
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        /*print("Selected row \(indexPath.row)")
        colorDictionaries.removeAtIndex(indexPath.row)
        
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)*/
    }

    
}
