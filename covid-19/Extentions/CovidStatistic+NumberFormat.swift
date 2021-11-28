//
//  CovidStatistic+NumberFormat.swift
//  covid-19
//
//  Created by Beelab on 28/11/21.
//

import Foundation

extension CovidStatistic{
    func separatedNumber(for number: Any) -> String {
        guard let itIsANumber = number as? NSNumber else { return "Not a number" }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = ","
        return formatter.string(from: itIsANumber)!
    }
}
