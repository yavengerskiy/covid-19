//
//  ViewController.swift
//  covid-19
//
//  Created by Beelab on 27/11/21.
//

import UIKit

class MainScreenViewController: UIViewController {

    var networkManager = NetworkManager()
    
    @IBOutlet weak var countryNameLabet: UILabel!
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var criticalLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var lastUpdateDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.onComplition = {covidStatistic in
            self.updateInterfaceWith(statistics: covidStatistic)
            
        }
        networkManager.fetchCurrentCovidStatistics(forCountry: "Uzbekistan")
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter country name", message: nil, style: .alert) { countryName in self.networkManager.fetchCurrentCovidStatistics(forCountry: countryName)
        }
    }

    func updateInterfaceWith(statistics: CovidStatistic) {
        DispatchQueue.main.async {
            self.countryNameLabet.text = statistics.country
            self.confirmedLabel.text = statistics.confirmedString
            self.recoveredLabel.text = String(statistics.recoveredString)
            self.deathsLabel.text = String(statistics.deathsString)
            self.criticalLabel.text = String(statistics.criticalString)
            self.lastUpdateDateLabel.text = statistics.lastUpdateString
        }
        
    }
}

