//
//  RMGetCharactersResponse.swift
//  RickAndMorty
//
//  Created by Stephanie on 24/10/23.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
