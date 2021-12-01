//
//  ViewController.swift
//  covid-19
//
//  Created by Beelab on 27/11/21.
//

import UIKit
import Alamofire

class MainScreenViewController: UIViewController {

    
    @IBOutlet weak var countryNameLabet: UILabel!
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var criticalLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var lastUpdateDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alamofireManualJSON(url: urlString + "Uzbekistan")
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter country name", message: nil, style: .alert) { countryName in
            self.alamofireManualJSON(url: urlString + countryName)
        }
    }
    
    private func alamofireManualJSON (url: String) {
        NetworkManager.shared.fetchDataWithAlamofire(url) { result in
            switch result {
            case .success(let covidStatistic):
                self.updateInterfaceWith(statistics: covidStatistic)
            case .failure(let error):
                print(error)
            }
        }
    }

    private func updateInterfaceWith(statistics: CovidStatistic) {
        self.countryNameLabet.text = statistics.country
        self.confirmedLabel.text = statistics.confirmedString
        self.recoveredLabel.text = String(statistics.recoveredString)
        self.deathsLabel.text = String(statistics.deathsString)
        self.criticalLabel.text = String(statistics.criticalString)
        self.lastUpdateDateLabel.text = statistics.lastUpdateString
    }
}

