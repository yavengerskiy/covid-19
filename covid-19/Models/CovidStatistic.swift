//
//  CovidStatistic.swift
//  covid-19
//
//  Created by Beelab on 27/11/21.
//

struct CovidStatistic {
    
    let country: String
    let confirmed,
        recovered,
        critical,
        deaths: Int
    
    var confirmedString: String {
        """
        Confirmed
        \(separatedNumber(for: confirmed))
        """
    }
    
    var recoveredString: String {
        """
        Recovered
        \(separatedNumber(for: recovered) )
        """
    }
    
    var criticalString: String {
        """
        Critical
        \(separatedNumber(for: critical))
        """
    }
    
    var deathsString: String {
        """
        Deaths
        \(separatedNumber(for: deaths))
        """
    }
    
    let lastUpdate: String
    var lastUpdateString: String {
        "Updated: \(lastUpdate.split(separator: "T").joined(separator: " ").prefix(19))"
    }
    
    init?(covidStatisticData: CovidStatisticData) {
        country = covidStatisticData.country
        confirmed = covidStatisticData.confirmed
        recovered = covidStatisticData.recovered
        critical = covidStatisticData.critical
        deaths = covidStatisticData.deaths
        lastUpdate = covidStatisticData.lastUpdate
    }
}


