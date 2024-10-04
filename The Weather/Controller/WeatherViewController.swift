//
//  ViewController.swift
//  The Weather
//
//  Created by Aytaç Bulanık on 27.09.2024.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherIconImage: UIImageView!
    @IBOutlet weak var dereceLabel: UILabel!
    
    var weatherManager = WeatherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchTextField.delegate = self
    }

    @IBAction func serachButtonPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    // klavyedeki go butonuna basıldığında gerçekleşecek kodlar aşağıdaki fonksiyonda yazılıyor.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Something"
            return false
        }
    }
    
    // textfield te yazmanın bittiğini anlatıyoruz.
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let city = searchTextField.text else { return }
        weatherManager.fetchWeather(cityName: city)
        searchTextField.text = ""
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.dereceLabel.text = weather.tempatureString
            self.cityLabel.text = weather.cityName
            self.weatherIconImage.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    
   
}

