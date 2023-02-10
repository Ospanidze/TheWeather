//
//  TheWeatherModel.swift
//  TheWeather
//
//  Created by Айдар Оспанов on 08.02.2023.
//

import Foundation

struct TheWeatherModel {
    
    var name: String = "Название"
    var temperature: Int = 0
    var iconCode: String = ""
    var url: String = ""
    var condition: String = ""
    var pressureMm: Int = 0
    var windSpeed: Double = 0
    var tempMin: Int = 0
    var tempMax: Int = 0
    
    var conditionString: String {
        switch condition {
        case "clear":                  return "Ясно"
        case "partly-cloudly":         return "Малооблачно"
        case "cloudly":                return "Облачно с прояснениями"
        case "overcast":               return "Пасмурно"
        case "drizzle":                return "Морось"
        case "light-rain":             return "Небольшой дождь"
        case "rain":                   return "Дождь"
        case "moderate-rain":          return "Умеренно сильный дождь"
        case "heavy-rain":             return "Сильный дождь"
        case "continuous-heavy-rain":  return "Длительный сильный дождь"
        case "showers":                return "Ливень"
        case "wet-snow":               return "Дождь снегом"
        case "light-snow":             return "Небольшой снег"
        case "snow":                   return "Снег"
        case "snow-showers":           return "Снегопад"
        case "hail":                   return "Град"
        case "thunderstorm":           return "Гроза"
        case "thunderstorm-with-rain": return "Дождь с грозой"
        case "thunderstorm-with-hail": return "Гроза с грозой"
            
        default: return "Загрузка"
        }
    }
    
    init?(weatherData: WeatherData) {
        
        temperature = weatherData.fact.temp
        iconCode = weatherData.fact.icon
        url = weatherData.info.url
        condition = weatherData.fact.condition
        pressureMm = weatherData.fact.pressureMm
        windSpeed = weatherData.fact.windSpeed
        tempMin = weatherData.forecasts.first?.parts.day.tempMin ?? 0
        tempMax = weatherData.forecasts.first?.parts.day.tempMax ?? 0
    }
    
    init() {
        
    }
}
