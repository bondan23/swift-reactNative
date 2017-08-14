//
//  Constants.swift
//  weatherApp
//
//  Created by Bondan Eko Prasetyo on 3/26/17.
//  Copyright © 2017 B-Soft. All rights reserved.
//

import Foundation

let BASE_URL: String = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE: String = "lat="
let LONGTITUDE: String = "&lon="
let APP_ID: String = "&appid="
let API_KEY: String = "0eccce3609bd44d183986571c8cafa28"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-32\(LONGTITUDE)123\(APP_ID)\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=-32&lon=123&cnt=10&appid=0eccce3609bd44d183986571c8cafa28"
