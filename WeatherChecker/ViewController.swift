//
//  ViewController.swift
//  WeatherChecker
//
//  Created by Peter Regard on 6/3/16.
//  Copyright © 2016 Peter Regard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var Reminder: UILabel!
    @IBOutlet weak var city: UITextField!
    @IBAction func Submit(sender: AnyObject)
    {
        textFieldShouldReturn(city)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        city.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool
    {
        let ident = city.text
        
            if ident == ""
            {
                return false
            }
            else
            {
                return true
            }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController: second = (segue.destinationViewController as? second)!
        
        destViewController.address = city.text!
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
}

