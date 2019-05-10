//
//  ChangeCityWeatherViewController.swift
//  Weatha
//
//  Created by Ahmed ibrahim on 3/9/19.
//  Copyright © 2019 Ahmed ibrahim. All rights reserved.
//

import UIKit

protocol changeCityName {
    func userChangedACityName(city: String)
}

class ChangeCityWeatherViewController: UIViewController {

    @IBOutlet weak var newCityTextField: UITextField!
    @IBOutlet weak var getWeatherButton: UIButton!
    
    var delegate: changeCityName?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getWeatherPressed(_ sender: UIButton) {
        let cityName:String = newCityTextField.text!
        delegate?.userChangedACityName(city: cityName)
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func returnBackPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
