//
//  EpisodeModel.swift
//  StarzPlay
//
//  Created by Usama Inaam Rasheed on 4/20/24.
//

import Foundation

struct EpisodeModel: Decodable {
    
    let episodes: [Episode]?
    let name, overview: String?
}

// MARK: - Episode
struct Episode: Decodable {
    
    let id: Int?
    let name, overview: String?
}
