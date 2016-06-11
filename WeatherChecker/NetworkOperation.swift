//
//  NetworkOperation.swift
//  WeatherChecker
//
//  Created by Peter Regard on 6/8/16.
//  Copyright © 2016 Peter Regard. All rights reserved.
//

import Foundation


class NetworkOperation
{
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    let queryURL: NSURL
    
    typealias JSONDictionaryCompletion = ([String: AnyObject]?) -> Void
    
    init(url: NSURL)
    {
        self.queryURL = url
        
    }
    
    
    
    
    func downloadJSONFromUrl(completion: JSONDictionaryCompletion)
    {
        
        let request: NSURLRequest = NSURLRequest(URL: queryURL)
        
        let dataTask = session.dataTaskWithRequest(request)
        { (let data, let response, let error) in
            
            //1. Check HTTP Response for sucsessful GET request
            
            if let httpResponse = response as? NSHTTPURLResponse
            {
                if httpResponse.statusCode == 200
                {
                    //2. Create JSON object with Data
                    do
                    {
                        let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String: AnyObject]
                        completion(jsonDictionary)
                    }
                    catch{print(error)}
                }
                else
                {
                    print("GET request not sucsessful. HTTP status code\(httpResponse.statusCode)")
                }
                
                
            }
                
                
            else
            {
                print("error, not a valid HTTP response")
            }
            
            
            
            
        }
        
        dataTask.resume()
        
    }
    
}






