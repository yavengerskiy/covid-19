//
//  ViewController+alertController.swift
//  covid-19
//
//  Created by Beelab on 27/11/21.
//

import UIKit

extension MainScreenViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHeandler: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { textField in
            textField.placeholder = "Input Country"
        }
        let searchButton = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alertController.textFields?.first
            guard let countryName = textField?.text else { return }
            if countryName != "" {
                let country = countryName.split(separator: " ").joined(separator: "%20")
                completionHeandler(country)
            }
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(searchButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
}

