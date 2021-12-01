//
//  CovidStatistic.swift
//  covid-19
//
//  Created by Beelab on 27/11/21.
//

struct CovidStatistic {
    
    let country: String?
    let confirmed,
        recovered,
        critical,
        deaths: Int?
    
    var confirmedString: String {
        """
        Confirmed
        \(separatedNumber(for: confirmed ?? 0))
        """
    }
    
    var recoveredString: String {
        """
        Recovered
        \(separatedNumber(for: recovered ?? 0) )
        """
    }
    
    var criticalString: String {
        """
        Critical
        \(separatedNumber(for: critical ?? 0))
        """
    }
    
    var deathsString: String {
        """
        Deaths
        \(separatedNumber(for: deaths ?? 0))
        """
    }
    
    let lastUpdate: String?
    var lastUpdateString: String {
        let updateDate = lastUpdate ?? "NoData"
        return "Updated: \(updateDate.split(separator: "T").joined(separator: " ").prefix(19))"
    }
    
    init(statisticData: [String: Any]) {
        country = statisticData["country"] as? String
        confirmed = statisticData["confirmed"] as? Int
        recovered = statisticData["recovered"] as? Int
        critical = statisticData["critical"] as? Int
        deaths = statisticData["deaths"] as? Int
        lastUpdate = statisticData["lastUpdate"] as? String
    }
}


