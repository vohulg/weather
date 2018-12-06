//
//  ViewController.swift
//  WeatherApp
//
//  Created by Admin on 12/6/18.
//  Copyright © 2018 nntz.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var orientationLabel: UILabel!
    
    let url = "https://api.openweathermap.org/data/2.5/weather?q=Almaty&id=524901&appid=95594aa6652b4aa32cd6116916fbe787"

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromSession()
    }  
   
    
    func loadDataFromSession() {
    
        let urlAddr = URL.init(string: self.url)
        let session = URLSession.shared
        
      

        let task = session.dataTask(with: urlAddr!) { (data, response, error) in
            
            if data != nil {
                
               
                do {
                    let jsonObj = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, Any>
                    
                    let weatherMap = OpenWeatherMap.init(weatherJson: jsonObj)
                    let city = weatherMap.city
                    let temp = weatherMap.temperature
                    let descr = weatherMap.description
                    
                    print("\(city) \(temp) \(descr)")
                    
                    
                   

                   
                     
                    
                    
                } catch {
                    print("Error serialization : \(error)")
                    
                }

            
            
            }
            
            
            
            //print("Response:\(response)")
        
            /*
            if error != nil {
                print("\(error) in fetch weather")
                return
            }
            
            if data != nil {
                let result = String.init(data: data!, encoding: .utf8)
                print("Loaded data: \(result)")
            }
 */
            
        }
        
        task.resume()
    
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        if UIDevice.current.orientation.isPortrait {
           self.orientationLabel.text = "Portrait"
        }
    }

    


}

