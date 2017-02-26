//
//  Constants.swift
//  TimeToBurn
//
//  Created by Jason Crawford on 2/26/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import Foundation

struct WeatherUrl {
    
    private let baseUrl = "https://api.worldweatheronline.com/premium/v1/weather.ashx"
    private let key = "&key=657cc2fc4bcc4a358c9173627172602"
    private let numDaysForecast = "&num_of_days=1"
    private let format = "&format=json"
    
    private var coordStr = ""
    
    init (lat: String, long: String) {
        self.coordStr = "?q=\(lat),\(long)"
    }
    
    func getFullUrl() -> String {
        return baseUrl + coordStr + key + numDaysForecast + format
    }
    
}

struct SkinType {
    let type1 = "Type 1 - Pale / Light"
    let type2 = "Type 2 - White / Fair"
    let type3 = "Type 3 - Medium"
    let type4 = "Type 4 - Olive Brown"
    let type5 = "Type 5 - Dark Brown"
    let type6 = "Type 6 - Very Dark / Black"
}

struct BurnTime {
    
    // all times in minutes
    let burnType1: Double = 67
    let burnType2: Double = 100
    let burnType3: Double = 200
    let burnType4: Double = 300
    let burnType5: Double = 400
    let burnType6: Double = 500
    
}

struct defaultsKeys {
    static let skinType = "skinType"
}

