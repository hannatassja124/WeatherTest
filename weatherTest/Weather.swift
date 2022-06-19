//
//  Weather.swift
//  weatherTest
//
//  Created by Hannatassja Hardjadinata on 19/06/22.
//

import Foundation

protocol Info {
    
}

class Weather {
    var lat: String
    var lon: String
    
    init(lat: String, lon: String){
        self.lat = lat
        self.lon = lon
    }
}

