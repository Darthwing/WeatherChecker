//
//  ViewController.swift
//  WeatherChecker
//
//  Created by Peter Regard on 6/3/16.
//  Copyright © 2016 Peter Regard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var city: UITextField!
    @IBAction func Submit(sender: AnyObject)
    {
        
        
            }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         var zip:Int? = Int(city.text!)
        var zipCode = zip
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
}

