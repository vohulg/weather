//
//  OpenWeatherMap.swift
//  WeatherApp
//
//  Created by Admin on 12/6/18.
//  Copyright © 2018 nntz.co. All rights reserved.
//

import Foundation
import UIKit

class OpenWeatherMap {

    var city : String?
    var temperature : CGFloat?
    var description : String?
    var currentTime : String?
    var icon : UIImage!
    var currentDate : String!
    
    init(weatherJson : Dictionary<String, Any>) {
        
        //city
        if let city = weatherJson["name"] as? String {
            self.city = city
        }
        
        //temperature
        if let main = weatherJson["main"] as? Dictionary<String, Any> {
        
            if let temp = main["temp"] as? CGFloat {
                self.temperature = temp
            }
        }
        
        //date
        if let dateInt = weatherJson["dt"] as? Double {
            self.currentDate = getCurrentTime(unixTime: dateInt)
        }
        else {
            self.currentDate = getCurrentTime(unixTime: 0)
        }
        
        //weather
        if let weather = weatherJson["weather"] as? Array<Dictionary<String, Any>> {
            
            if weather.count <= 0 {
                print("weather field is empty")
                return
            }
            
            //description
            if let descr = weather[0]["description"] as? String {
                self.description = descr
            }
            
            //icon
            if let iconName = weather[0]["icon"] as? String {
                self.icon = UIImage.init(named: iconName)
            }
            
        }
        
        // current time
        self.currentTime = getCurrentTime(unixTime: 0)
        
        //icon
        
        
        
        
        
    }
    
    
    func getCurrentTime(unixTime:Double) -> String? {
        
        let dTime = Date.init(timeIntervalSince1970: unixTime)
        
            let defaultTime = Date.init(timeIntervalSinceNow: 0)
            let formatter = DateFormatter.init()
            formatter.setLocalizedDateFormatFromTemplate("yyyy:mm:dd H:s:M")
            let dateStr = formatter.string(from: dTime)
            //formatter.setLocalizedDateFormatFromTemplate("yyyy:mm:dd H:s:M
 
       
        
        return dateStr
    }

}
