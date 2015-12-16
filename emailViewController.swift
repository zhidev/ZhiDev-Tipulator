//
//  emailViewController.swift
//  Zhi's Tips
//
//  Created by Douglas on 12/15/15.
//  Copyright © 2015 Dougli. All rights reserved.
//

import UIKit
import MessageUI


class emailViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet var subject: UITextField!
    
    @IBOutlet var body: UITextView!
    
    @IBOutlet var send: UIButton!
    
    var bill:String?
    var tip:String?
    var total:String?
    var gratuity:String?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        subject.delegate = self
        
        body.delegate = self
        

        body.text = createEmail()
        
        subject.text = createSubject()
        
    }

    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let colors = defaults.integerForKey("colors")
        themeChange(colors)
    }
    
    @IBAction func sendMail(sender: AnyObject) {
        let picker = MFMailComposeViewController()
        picker.mailComposeDelegate = self
        picker.setSubject(subject.text!)
        picker.setMessageBody(body.text!, isHTML: false)
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    

    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        body.text = textView.text
        
        if text == "\n" {
            textView.resignFirstResponder()
            
            return false
        }
        
        return true
    }
    func createEmail() -> String{
        var Body:String = "Bill: " + bill! + "\nTip: " + tip!
        Body = Body +  "\nTotal" + total! + "\nTip %: " + gratuity! + "\n"
        Body = Body + "Location: "
        Body = Body + "\n\n Rating (Out of 10): "
        
        return Body
    }
    
    func createSubject() -> String{
        let currentDate = NSDate()
        
        let defaultSubject:String = "Automatically generated E-mail from Tipulator on:"
        
        let subject = defaultSubject + String(currentDate)
        
        return subject
    }
    func themeChange(value: Int){
        if(value == 0){
            self.view.backgroundColor = UIColor.cyanColor()
            self.body.textColor = UIColor.blackColor()
        }
        else if (value == 1){
            self.view.backgroundColor = UIColor.blackColor()
            self.body.textColor = UIColor.whiteColor()
            
        }
    }
}
