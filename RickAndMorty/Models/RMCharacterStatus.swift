//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Stephanie on 22/10/23.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"        // Vivo
    case `dead` = "Dead"        // Morto
    case `unknown` = "unknown"  // Desconhecido
    
    var text: String{
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
