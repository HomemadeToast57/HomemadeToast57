//
//  WeatherManager.swift
//  Clima
//
//  Created by Jacob Singer on 11/13/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

protocol WeatherManagerDelagate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}


struct WeatherManager {
    
    var delagate: WeatherManagerDelagate?
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4f50e4d0ffdfd56edf3fc0bee4322495&&units=imperial"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func fetchWeather(longitude: CLLocationDegrees, latitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? " ") {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delagate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delagate?.didUpdateWeather(self, weather: weather)
                        
                    }
                }
            }
            
            task.resume()
        }
        
        
        
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            delagate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}
