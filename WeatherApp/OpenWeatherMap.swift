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
    var temperature : Int?
    var description : String?
    var currentTime : String
    //var icon : UIImage
    
    init(weatherJson : Dictionary<String, Any>) {
        
        //city
        if let city = weatherJson["name"] as? String {
            self.city = city
        }
        
        //temperature
        if let main = weatherJson["main"] as? Dictionary<String, Any> {
        
            if let temp = main["temp"] as? Int {
                self.temperature = temp
            }
        }
        
        if let weather = weatherJson["weather"] as? Array<Dictionary<String, Any>> {
            if weather.count > 0, let descr = weather[0]["description"] as? String {
                        self.description = descr
            }
        }
        
        // current time
        
        let defaultTime = Date.init(timeIntervalSinceNow: 0)
        
        let formatter = DateFormatter.init()
        let dateStr = formatter.string(from: defaultTime)
        //formatter.setLocalizedDateFormatFromTemplate("yyyy:mm:dd H:s:M")
        
        
        
        
    }

}
