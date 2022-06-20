//
//  Weather.swift
//  weatherTest
//
//  Created by Hannatassja Hardjadinata on 19/06/22.
//

import Foundation

struct Weather: Decodable {
    var lat: Double
    var lon: Double
    var current: CurrentWeather
    var daily: [DailyWeather]
}

struct CurrentWeather: Decodable {
    var dt: Double
    var temp: Double
    var pressure: Double
    var humidity: Double
    var wind_speed: Double
    var weather: [WeatherDetail]
}

struct WeatherDetail: Decodable {
    var main: String
    var icon: String
}

struct DailyWeather: Decodable {
    var dt: Double
    var temp: Temp
    var weather: [WeatherDetail]
}

struct Temp: Decodable {
    var day: Double
}

struct data {
    var country: String
    var cities: [String]
    
    enum CodingKeys: String, CodingKey {
        case country, cities
    }
}

extension data: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        country = try values.decode(String.self, forKey: .country)
        cities = try values.decode([String].self, forKey: .cities)
    }
}

extension data: Encodable {
    func encode(to encoder: Encoder) throws {
        var container  = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.country, forKey: .country)
        try container.encode(self.cities, forKey: .cities)
    }
}

struct test: Decodable {
    var lat: Double
    var lon: Double
}
