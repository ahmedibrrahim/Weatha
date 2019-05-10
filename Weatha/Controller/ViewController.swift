//
//  ViewController.swift
//  Weatha
//
//  Created by Ahmed ibrahim on 3/9/19.
//  Copyright © 2019 Ahmed ibrahim. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, CLLocationManagerDelegate, changeCityName {

    //Pre-linked IBOutlets
    @IBOutlet weak var tempDegree: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    
    //Constants
    let APIKey = "4bc4a623bee910fbb2f411399c8bb62e"
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather"
    
    let weatherDataModel = WeatherDataModel()
    
    let locationManager = CLLocationManager()
    
    
    //TODO: Declare instance variables here
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO:Set up the location manager here.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    
    func getWeatherData(url: String, parameters: [String:String]){
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON{
            response in
            if response.result.isSuccess{
                print("Success!")
                let weatherJSON = JSON(response.result.value!)     //get the response value from the API server and convert it to a JSON datatype.
//                print(weatherJSON)
                self.updateWeatherData(json: weatherJSON)
            }
            else{
                print("Error!, \(String(describing: response.result.error))")
                self.cityLabel.text = "Connection Error!"
            }
        }
    }
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
    //Write the updateWeatherData method here:
    
    func updateWeatherData(json: JSON){
        if let weatherTemp = json["main"]["temp"].double{  //get the "temp" value only from the json data and print it.
            weatherDataModel.setTemperatureValue(value: Int(weatherTemp - 273.15))
            weatherDataModel.setConditionValue(value: json["weather"][0]["id"].int!)
            weatherDataModel.setCityName(name: json["name"].string!)
            weatherDataModel.setWeatherIconName(name: weatherDataModel.getWeatherIconName(condition: weatherDataModel.getConditionValue()))
            
            updateUIWithWeatherData()
    }
        else{
            self.cityLabel.text = "Weather Unavailable!"
        }
    }
    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    //Write the updateUIWithWeatherData method here:
    
    func updateUIWithWeatherData(){
        tempDegree.text = String(weatherDataModel.getTemperatureValue())
        cityLabel.text = String(weatherDataModel.getCityName())
        weatherImage.image = UIImage(named: weatherDataModel.getWeatherIconName(condition: weatherDataModel.getConditionValue()))
        
    }
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[locations.count - 1]      //get the last location in the array
        if location.horizontalAccuracy > 0{                //if that location is valid, do the following
            locationManager.stopUpdatingLocation()         //stop updating the location data
            
            let latitude = String(location.coordinate.latitude)    //get the latitude and store it inside this variable
            let longitude = String(location.coordinate.longitude)  //get the latitude and store it inside this variable
            
            print("longitude is: \(longitude), latitude is: \(latitude)")   //print the longitude and the latitude to the console.
            
            let params: [String:String] = ["lat": latitude, "lon": longitude, "appid": APIKey]    //the params used to send a http request to the API to grab the data.
            getWeatherData(url: weatherURL, parameters: params)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "unavailable location"
    }
    
    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    func userChangedACityName(city: String) {
        let params: [String:String] = ["q": city, "appid":APIKey]
        getWeatherData(url: weatherURL, parameters: params)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ChangeCityName":
            let destinationVC = segue.destination as! ChangeCityWeatherViewController
            destinationVC.delegate = self
        default:
            print("delegation error happened!")
        }
    }

    }

