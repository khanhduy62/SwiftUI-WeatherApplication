//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by DuyLe on 7/26/26.
//

import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let location: Location
    let current: Current
}

// MARK: - Current
struct Current: Codable {
    let tempC: Double
    let condition: Condition
    let feelslikeC: Double
    

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition
        case feelslikeC = "feelslike_c"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: String
    let icon: String
    let code: Int
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tzID: String
    let localtimeEpoch: Int
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case region = "region"
        case country = "country"
        case lat = "lat"
        case lon = "lon"
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime = "localtime"
    }
}
