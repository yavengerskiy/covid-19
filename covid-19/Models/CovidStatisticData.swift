//
//  CovidStatisticData.swift
//  covid-19
//
//  Created by Beelab on 27/11/21.
//

struct CovidStatisticData: Decodable{
    let country: String
    let confirmed, recovered, critical, deaths: Int
    let lastUpdate: String
}
