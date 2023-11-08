//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Stephanie on 22/10/23.
//

import Foundation

// fronzen significa uma anotação congelada
/// Represents unique API endpoint. 
// (Representa exclusivo pontos de extremidade da API)
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    // (Endpoint para obter informações do personagem)
    case character = "/api/character"
    /// Endpoint to get location info
    // (Endpoint para obter informações da localização)
    case location
    /// Endpoint to get episode info
    // (Endpoint para obter informações do episodio)
    case episode
}
