//
//  File.swift
//  WeatherChecker
//
//  Created by Peter Regard on 6/5/16.
//  Copyright © 2016 Peter Regard. All rights reserved.
//

import UIKit

class second: UIViewController {
    
    @IBOutlet weak var ShowsWeb: UIWebView!
    
    @IBOutlet var CurrWeather: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let url  = NSURL (string: "https://www.wunderground.com/cgi-bin/findweather/getForecast?query=40361&MR=1")
//        let task = NSURLSession.sharedSession().dataTaskWithURL(url!)
//        {
//            (data, response, error) in
//            
//            if error == nil
//            {
//                let urlContent = NSString(data: data!, encoding: NSASCIIStringEncoding)
//                
//                print(urlContent)
//                print ("_____________________________________________________________________________________")
//                print ("_____________________________________________________________________________________")
//                print ("_____________________________________________________________________________________")
//                print ("_____________________________________________________________________________________")
//                print ("_____________________________________________________________________________________")
//                print ("_____________________________________________________________________________________")
//
//                var urlContentArr = urlContent?.componentsSeparatedByString("wx-value")
//                print (urlContentArr![1])
//                
//                dispatch_async(dispatch_get_main_queue())
//                {
//               
//                }
//            }
//        }
//        
//        task.resume()
        
      let zip = kZIP_KEY
        
        if let url = NSURL(string: "http://www.thefuckingweather.com/Where/\("v")") {
            do {
                let contents = try NSString(contentsOfURL: url, usedEncoding: nil)
                print(contents)
                var urlContentArr = contents.componentsSeparatedByString("jsMainTemp\" tempf=\"")
                print ("_____________________________________________________________________________________")
                print ("_____________________________________________________________________________________")
                print ("_____________________________________________________________________________________")
                print ("_____________________________________________________________________________________")
                print ("_____________________________________________________________________________________")
                print ("_____________________________________________________________________________________")

                print (urlContentArr[1])
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
        
        
        
        
        
//        CurrWeather.text = "wind is \()"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
}


