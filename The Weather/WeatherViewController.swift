//
//  ViewController.swift
//  The Weather
//
//  Created by Aytaç Bulanık on 27.09.2024.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherIconImage: UIImageView!
    @IBOutlet weak var dereceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }

    @IBAction func serachButtonPressed(_ sender: UIButton) {
        
    }
    
    // klavyedeki go butonuna basıldığında gerçekleşecek kodlar aşağıdaki fonksiyonda yazılıyor.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        searchTextField.endEditing(true)
        return true
    }
    
    // textfield te yazmanın bittiğini anlatıyoruz.
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = ""
    }
    
}

