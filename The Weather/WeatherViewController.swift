//
//  ViewController.swift
//  The Weather
//
//  Created by Aytaç Bulanık on 27.09.2024.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherIconImage: UIImageView!
    @IBOutlet weak var dereceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func serachButtonPressed(_ sender: UIButton) {
        
    }
    
}

