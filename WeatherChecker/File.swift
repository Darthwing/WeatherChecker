//
//  File.swift
//  WeatherChecker
//
//  Created by Peter Regard on 6/5/16.
//  Copyright © 2016 Peter Regard. All rights reserved.
//

import UIKit
import CoreLocation
import AddressBookUI



class second: UIViewController {
    
    
    
    
    @IBAction func refresh(sender: UIBarButtonItem) {
        
        self.feelsLabel.hidden = true
        self.Feels.hidden = true
        
        self.tempLabel?.hidden = true
        
        self.precipLabel?.hidden = true
        self.precip.hidden = true
        
        self.Humid.hidden = true
        self.humidLabel.hidden = true
        
        self.waitingDial.hidden = false
        
        self.noLocation.hidden = true
        
        self.sunnyIcon.hidden = true
        self.clearNightIcon.hidden = true
        self.rainyIcon.hidden = true
        self.snowyIcon.hidden = true
        self.windyIcon.hidden = true
        self.foggyIcon.hidden = true
        self.cloudyIcon.hidden = true
        self.partlyCloudyIcon.hidden = true
        self.cloudyNightIcon.hidden = true
        
        
        
        geocoding("\(address)")
        {
            //        Weather
            //        __________________________________________________________________
            
            
            print("this is the new Lat \(self.newLat)")
            self.forecastUrl = NSURL(string: "https://api.forecast.io/forecast/956caa21f4ca41ecf05999993bbfcbe1/\(self.newLat),\(self.newLong)")
            print(self.forecastUrl!)
            self.getForecast(){(let currently) in
                if let currentWeather = currently
                {
                    // Update UI
                    dispatch_async(dispatch_get_main_queue())
                    {
                        self.DWNLoadJson()
                        
                        
                        // Use NSURL Session Api to fetch Data
                        
                        
                        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
                        let session = NSURLSession(configuration: configuration)
                        
                        // NSURL Request Object
                        
                        let request = NSURLRequest(URL: self.forecastUrl!)
                        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                            //                            print(data!)
                        })
                        dataTask.resume()
                        
                        
                    }
                    self.waitingDial.hidden = true
                    
                    self.tempLabel?.text = "\(currentWeather.temperature!)º"
                    self.tempLabel?.hidden = false
                    
                    self.precipLabel?.text = "\(currentWeather.precipWhole!)%"
                    self.precipLabel?.hidden = false
                    
                    self.humidLabel?.text = "\(currentWeather.humidWhole!)%"
                    self.humidLabel.hidden = false
                    
                    self.feelsLabel?.text = "\(currentWeather.feelsLike!)º"
                    self.feelsLabel.hidden = false
                    
                    self.precip.hidden = false
                    self.Humid.hidden = false
                    self.Feels.hidden = false
                    
                    switch (currentWeather.icon)
                    {
                    case "clear-day"? :
                        self.sunnyIcon.hidden = false
                        
                    case "clear-night"? :
                        self.clearNightIcon.hidden = false
                        
                    case "rain"? :
                        self.rainyIcon.hidden = false
                        
                    case "snow"?:
                        self.snowyIcon.hidden = false
                        
                    case "wind"? :
                        self.windyIcon.hidden = false
                        
                    case "fog"? :
                        self.foggyIcon.hidden = false
                        
                    case "cloudy"? :
                        self.cloudyIcon.hidden = false
                        
                    case "partly-cloudy-day"? :
                        self.partlyCloudyIcon.hidden = false
                        
                    case "partly-cloudy-night"? :
                        self.cloudyNightIcon.hidden = false
                        
                    default:
                        self.sunnyIcon.hidden = false
                        
                        
                    }

                }
                
            }
            
        }

    }
    
    
    
    
    
   
    @IBOutlet weak var clearNightIcon: UIImageView!
    @IBOutlet weak var cloudyIcon: UIImageView!
    @IBOutlet weak var cloudyNightIcon: UIImageView!
    @IBOutlet weak var foggyIcon: UIImageView!
    @IBOutlet weak var partlyCloudyIcon: UIImageView!
    @IBOutlet weak var rainyIcon: UIImageView!
    @IBOutlet weak var snowyIcon: UIImageView!
    @IBOutlet weak var windyIcon: UIImageView!
    @IBOutlet weak var sunnyIcon: UIImageView!
    
    
    @IBOutlet weak var Feels: UILabel!
    @IBOutlet weak var Humid: UILabel!
    @IBOutlet weak var tempLabel: UILabel?
    @IBOutlet weak var precip: UILabel!
    
    @IBOutlet weak var waitingDial: UIActivityIndicatorView!
    
    @IBOutlet weak var feelsLabel: UILabel!
    @IBOutlet weak var humidLabel: UILabel!
    @IBOutlet weak var precipLabel: UILabel?
    
    var firstViewController: ViewController?

    @IBOutlet weak var noLocation: UILabel!
    
    var newLat:Double = 0.0
    var newLong:Double = 0.0
    var forecastUrl = NSURL(string:"")
    var address = "40507"
    var coordinates = (0.0 , 0.0)
    
    
    
    
    
    override func viewDidLoad()
    {
                
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //        Geocoding
        //        __________________________________________________________________
        
        print("At load time: \(coordinates)")
        geocoding("\(address)")
        {
            //        Weather
            //        __________________________________________________________________
            
            
            print("this is the new Lat \(self.newLat)")
            self.forecastUrl = NSURL(string: "https://api.forecast.io/forecast/956caa21f4ca41ecf05999993bbfcbe1/\(self.newLat),\(self.newLong)")
            print(self.forecastUrl!)
            self.getForecast(){(let currently) in
                if let currentWeather = currently
                {
                    // Update UI
                    dispatch_async(dispatch_get_main_queue())
                    {
                        self.DWNLoadJson()
                        
                        
                        // Use NSURL Session Api to fetch Data
                        
                        
                        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
                        let session = NSURLSession(configuration: configuration)
                        
                        // NSURL Request Object
                        
                        let request = NSURLRequest(URL: self.forecastUrl!)
                        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
//                            print(data!)
                        })
                        dataTask.resume()
                        
                        
                    }
                        self.waitingDial.hidden = true
                    
                        self.tempLabel?.text = "\(currentWeather.temperature!)º"
                        self.tempLabel?.textColor = UIColor.whiteColor()
                    
                        self.precipLabel?.text = "\(currentWeather.precipWhole!)%"
                        self.precipLabel?.textColor = UIColor.whiteColor()
                    
                        self.humidLabel?.text = "\(currentWeather.humidWhole!)%"
                        self.humidLabel.textColor = UIColor.whiteColor()
                    
                        self.feelsLabel?.text = "\(currentWeather.feelsLike!)º"
                        self.feelsLabel.textColor = UIColor.whiteColor()
                    
                        self.precip.textColor = UIColor.whiteColor()
                        self.Humid.textColor = UIColor.whiteColor()
                        self.Feels.textColor = UIColor.whiteColor()
                    
                        switch (currentWeather.icon)
                        {
                        case "clear-day"? :
                            self.sunnyIcon.hidden = false
                            
                        case "clear-night"? :
                            self.clearNightIcon.hidden = false
                            
                        case "rain"? :
                            self.rainyIcon.hidden = false
                            
                        case "snow"?:
                            self.snowyIcon.hidden = false
                            
                        case "wind"? :
                            self.windyIcon.hidden = false
                            
                        case "fog"? :
                            self.foggyIcon.hidden = false
                            
                        case "cloudy"? :
                            self.cloudyIcon.hidden = false
                            
                        case "partly-cloudy-day"? :
                            self.partlyCloudyIcon.hidden = false
                            
                        case "partly-cloudy-night"? :
                            self.cloudyNightIcon.hidden = false
     
                        default:
                            self.sunnyIcon.hidden = false
                            
                            
                        }
                }
                
            }
            
        }
        
        
    }
    
    
    
    // func GetForecast
    func getForecast(completion: (CurrentWeather? -> Void))
    {
        print(self.forecastUrl)
        let networkOperation = NetworkOperation(url: (self.forecastUrl)!)
        networkOperation.downloadJSONFromUrl
            { (let JSONDictionary) in
                let currentWeather = self.currentWeatherFromJSON(JSONDictionary)
                completion(currentWeather)
        }
        
    }
    
    
    func geocoding(location: String, completion: () -> ())
    {
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            if placemarks?.count > 0
            {
                let placemark = placemarks?[0]
                let location = placemark!.location
                let coordinate = location?.coordinate
                self.coordinates = (coordinate!.latitude, coordinate!.longitude)
                self.newLat = (coordinate!.latitude)
                self.newLong = (coordinate!.longitude)
                print("Inside completion handler: \(self.coordinates)")
                completion()
            }
            else
            {
                print("Sorry, I am not able to find that location.")
                self.waitingDial.hidden = true
                self.noLocation.hidden = false
                
            }
        }
        print("Outside completion handler: \(self.coordinates)")
    }
    
    func currentWeatherFromJSON(jsonDictionary: [String: AnyObject]?) -> CurrentWeather?
    {
        if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: AnyObject]
        {
            return CurrentWeather(weatherDictionary: currentWeatherDictionary)
        }
        else
        {
            print("JSON Dictionary returned nil for 'currently' key")
            return nil
        }
    }
    
    
    func DWNLoadJson ()
    {
        let requestURL: NSURL = NSURL(string: "https://api.forecast.io/forecast/956caa21f4ca41ecf05999993bbfcbe1/\(self.newLat),\(self.newLong)")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200)
            {
                print("Everyone is fine, Weather downloaded successfully.")
                do
                {
                    
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String: AnyObject]
                    
                    print(jsonDictionary)
                }
                catch {print(error)}

            }
            
        }
        
        task.resume()
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
}


