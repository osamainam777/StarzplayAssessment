//
//  SeasonModel.swift
//  StarzPlay
//
//  Created by Usama Inaam Rasheed on 4/20/24.
//

import Foundation


struct SeasonModel: Decodable {
    
    let id: Int?
    let name: String?
    let overview: String?
    var seasons: [Season]?
    
}

// MARK: - Season
struct Season: Decodable {
    let id: Int?
    let name: String?
    let season_number: Int?
}


