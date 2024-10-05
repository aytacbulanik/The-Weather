//
//  ViewController.swift
//  The Weather
//
//  Created by Aytaç Bulanık on 27.09.2024.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherIconImage: UIImageView!
    @IBOutlet weak var dereceLabel: UILabel!
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    var longatiude: CLLocationDegrees?
    var latitude: CLLocationDegrees?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        
        weatherManager.delegate = self
        searchTextField.delegate = self
    }
    
    
    @IBAction func currentLocationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
}
// MARK: - UITextFieldDelegate
extension WeatherViewController : UITextFieldDelegate {
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
}

// MARK: - WeatherManagerDelegate
extension WeatherViewController : WeatherManagerDelegate {
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

extension WeatherViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            manager.stopUpdatingLocation()
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            weatherManager.fetchWeatherWithCoor(latitude: latitude, longutide: longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

