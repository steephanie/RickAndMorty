//
//  RMCharacterGender.swift
//  RickAndMorty
//
//  Created by Stephanie on 22/10/23.
//

import Foundation

enum RMCharacterGender: String, Codable {
    case male = "Male"              // Masculino
    case female = "Female"          // Feminino
    case genderless = "Genderless"  // Sem genero
    case unknown = "unknown"        // Desconhecido
}
