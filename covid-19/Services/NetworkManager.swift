//
//  NetworkManager.swift
//  covid-19
//
//  Created by Beelab on 27/11/21.
//

import Alamofire

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    enum NetworkError: Error {
        case invalidURL
        case noData
        case decodingError
    }
    
    func fetchDataWithAlamofire(_ url: String, completion: @escaping(Result<CovidStatistic, NetworkError>) -> Void ) {
        let httpHeaders: HTTPHeaders = ["x-rapidapi-host" : rapidapiHost, "x-rapidapi-key" : rapidapiKey]
        AF.request(url, headers: httpHeaders)
           .validate()
           .responseJSON { dataResponse in  
            switch dataResponse.result {
            case .success(let value):
                guard let statisticsData = value as? [[String: Any]] else { return }
                
                guard let statisticData =  statisticsData.first else { return }
                let covedStatistics = CovidStatistic(statisticData: statisticData)
                completion(.success(covedStatistics))
            case .failure:
                completion(.failure(.decodingError))
            }
        }
        
    }
}
