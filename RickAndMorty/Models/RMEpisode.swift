//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Stephanie on 19/10/23.
//

import Foundation

struct RMEpisode: Decodable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
