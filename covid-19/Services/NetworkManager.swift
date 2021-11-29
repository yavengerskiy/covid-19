//
//  NetworkManager.swift
//  covid-19
//
//  Created by Beelab on 27/11/21.
//

import Foundation

struct NetworkManager {
    
    var onComplition: ((CovidStatistic) -> Void)?
    
    func fetchCurrentCovidStatistics(forCountry country: String){
        let urlString = urlString + country
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue(rapidapiHost, forHTTPHeaderField: "x-rapidapi-host")
            request.setValue(rapidapiKey, forHTTPHeaderField: "x-rapidapi-key")
        
        URLSession.shared.dataTask(with: request) { data, responce, error in
            if let data = data {
                if let covidStatistics = parseJSON(withData: data){
                    self.onComplition?(covidStatistics)
                }
            } else {
                print(error?.localizedDescription ?? "No error description")
            }
        }.resume()
    }
    
    private func parseJSON(withData data: Data) -> CovidStatistic?{
        do {
            let covidStatisticData: [CovidStatisticData] = try JSONDecoder().decode([CovidStatisticData].self, from: data)
            if let covidStatisticFirstElement = covidStatisticData.first {
                guard let covidStatistic = CovidStatistic(covidStatisticData: covidStatisticFirstElement) else { return nil }
                return covidStatistic
            }
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
