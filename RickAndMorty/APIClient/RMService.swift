//
//  RMService.swift
//  RickAndMorty
//
//  Created by Stephanie on 20/10/23.
//

import Foundation

/// Primary API service object to get Rick and Morty data. 
// (Objeto de serviço API para obter Rick e Morty dados.)
final class RMService {
    /// Shared singleton instance 
    // (Compartilhado Sigleton instancia)
    static let shared = RMService()
    
    /// Privatized constructor
    // (Construtor privatizado)
    private init() {}
    
    /// Send Rick and Morty API Call 
    // (enviar chamada de API de Rick and Morty)
    /// - Parameters
    ///     - request: Request instance 
    // (instancia de solicitação)
    ///     - completion: Callback with data or error
    // (chamada com dados ou erro)
    public func execute(_ request: RMRequest, completion: @escaping ()  -> Void) {
        
    }
}
