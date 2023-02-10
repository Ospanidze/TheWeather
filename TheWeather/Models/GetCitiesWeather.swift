//
//  GetCitiesWeather.swift
//  TheWeather
//
//  Created by Айдар Оспанов on 09.02.2023.
//

import Foundation
import CoreLocation

let networkWeatherManager = NetworkWeatherManager()

func getCityWeather(nameCities: [String], completionHandler: @escaping(Int, TheWeatherModel) -> Void) {
    
    for (index, item) in nameCities.enumerated() {
        
        getCoordinateFrom(city: item) { coordinate, error in
            guard let coordinate = coordinate, error == nil else { return }
            
            networkWeatherManager.fetchWeather(latitude: coordinate.latitude, longitude: coordinate.longitude) { weather in
                completionHandler(index, weather)
            }
        }
    }
}


func getCoordinateFrom(city: String, completion: @escaping (_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> Void) {
    CLGeocoder().geocodeAddressString(city) { placemark, error in
        completion(placemark?.first?.location?.coordinate, error)
    }
}
