//
//  CurrentWeather.swift
//  WeatherChecker
//
//  Created by Peter Regard on 6/6/16.
//  Copyright © 2016 Peter Regard. All rights reserved.
//

import Foundation


struct CurrentWeather {
    var temperature: Int?
    var humidity: Int?
    var humidWhole: Int?
    var precipWhole: Int?
    var summary: String?
    var wind: Int?
    var feelsLike: Int?
    var icon: String?
    
    init(weatherDictionary: [String: AnyObject]){
        
        icon = weatherDictionary["icon"] as? String
        temperature = weatherDictionary["temperature"] as? Int
        feelsLike = weatherDictionary["apparentTemperature"] as? Int
        if let humidity = weatherDictionary["humidity"] as? Double
        {
            humidWhole = Int(humidity*100)
        }
        else
        {
            humidWhole = nil
        }

        if let precipProb = weatherDictionary["precipProbability"] as? Double
        {
            precipWhole = Int(precipProb*100)
        }
        else
        {
            precipWhole = nil
        }
        summary = weatherDictionary["summary"] as? String
        wind = weatherDictionary["windSpeed"] as? Int
    }
    
    
}

