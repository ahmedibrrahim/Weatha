//
//  WeatherDataModel.swift
//  Weatha
//
//  Created by Ahmed ibrahim on 3/17/19.
//  Copyright © 2019 Ahmed ibrahim. All rights reserved.
//

import Foundation

class WeatherDataModel{
    
    private var temperature: Int = 0
    private var condition: Int = 0
    private var city: String = ""
    private var weatherIconName: String = ""

    init() {
    }
    
    //*******************************************************SETTERS***********************************************
    func setTemperatureValue(value: Int){
        temperature = value
    }
    
    func setConditionValue(value: Int){
        condition = value
    }
    
    func setCityName(name: String){
        city = name
    }
    
    func setWeatherIconName(name: String){
        weatherIconName = name
    }
    
    //********************************************************GETTERS***************************************************
    func getTemperatureValue() -> Int{
        return temperature
    }
    
    func getConditionValue() -> Int{
        return condition
    }
    
    func getCityName() -> String{
        return city
    }
    
    func getWeatherIconName(condition: Int) -> String{
        
        switch (condition) {
            
        case 0...300 :
            return "tstorm1"
            
        case 301...500 :
            return "light_rain"
            
        case 501...600 :
            return "shower3"
            
        case 601...700 :
            return "snow4"
            
        case 701...771 :
            return "fog"
            
        case 772...799 :
            return "tstorm3"
            
        case 800 :
            return "sunny"
            
        case 801...804 :
            return "cloudy2"
            
        case 900...903, 905...1000  :
            return "tstorm3"
            
        case 903 :
            return "snow5"
            
        case 904 :
            return "sunny"
            
        default :
            return "dunno"
        }
    }
}
