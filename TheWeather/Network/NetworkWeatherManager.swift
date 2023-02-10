//
//  NetworkWeatherManager.swift
//  TheWeather
//
//  Created by Айдар Оспанов on 08.02.2023.
//

import Foundation

struct NetworkWeatherManager {
    
    func fetchWeather(latitude: Double, longitude: Double, completionHandler: @escaping(TheWeatherModel) -> Void) {

        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: .infinity)
        request.addValue(apikey, forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
            
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            //print(String(data: data, encoding: .utf8)!)
            if let weather = self.parseJSON(withData: data) {
                completionHandler(weather)
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> TheWeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let weather = TheWeatherModel(weatherData: weatherData) else {
                return nil
            }
            return weather
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
