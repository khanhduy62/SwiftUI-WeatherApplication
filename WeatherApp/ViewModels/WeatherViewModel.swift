//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by DuyLe on 7/26/26.
//

import Foundation

@Observable
class WeatherViewModel {
    var city: String = ""
    var weather: WeatherResponse?
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let apiKey = "API_KEY"
}
