//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Stephanie on 19/10/23.
//

import Foundation

struct RMLocation: Decodable {
         let id: Int
         let name: String
         let type: String
         let dimension: String
         let residents: [String]
         let url: String
         let created: String
}
