//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Stephanie on 20/10/23.
//

import Foundation

/// Object that represents a singlet API call. 
// (Objeto que representa uma única API)
final class RMRequest {
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com"
    }
    
    /// Desired endpoint
    private let endpoint: RMEndpoint
    
    /// Path components for API, if any
    private let pathComponents: [String]
    
    /// Query arguments for API, if any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the api request in string format
    // URL construido para solicitações em formato de string
//    private var urlString: String {
//        var string = Constants.baseUrl
//       // string += "/"
//        string += endpoint.rawValue
//        
//        if !pathComponents.isEmpty {
//            pathComponents.forEach({
//                string += "/\($0)"
//            })
//        }
//        
//        if !queryParameters.isEmpty {
//            string += "?"
//            let argumentString = queryParameters.compactMap({
//                guard let value = $0.value else { return nil }
//                return "\($0.name)=\(value)"
//            }).joined(separator: "&")
//            
//            string += argumentString
//        }
//        
//        return string
//    }
    
    /// Computed & constructed API url
    public var url: URL? {
        var components = URLComponents(string: Constants.baseUrl)
        components?.queryItems = queryParameters
        components?.path = endpoint.rawValue
        for pathComponent in pathComponents {
            components?.path.append(pathComponent)
        }
        return components?.url
        //return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    // MARK: Public
    
    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of Path components
    ///   - queryParameters: Collection of query parameters
    public init(
        endpoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    convenience init?(url: URL) {
        let string = url.absoluteString
        if !string.contains(Constants.baseUrl) {
            return nil
        }
        
        guard let endpoint = RMEndpoint(rawValue: url.path()) else {
            return nil
        }
        let queryParameters = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems ?? []
        self.init(endpoint: endpoint, queryParameters: queryParameters)
//        let trimmed = string.replacingOccurrences(of: Constants.baseUrl, with: "")
//        if trimmed.contains("") {
//            let components = trimmed.components(separatedBy: "/")
//            if !components.isEmpty {
//                let endpointString = components[0]
//                if let rmEndpoint = RMEndpoint(
//                    rawValue: endpointString
//                ) {
//                    self.init(endpoint: rmEndpoint)
//                    return
//                }
//            }
        
//        } else if trimmed.contains("?") {
//            let components = trimmed.components(separatedBy: "?")
//                if !components.isEmpty {
//                    let endpointString = components[0]
//                    if let rmEndpoint = RMEndpoint(rawValue: endpointString) {
//                        self.init(endpoint: rmEndpoint)
//                        return
//                    }
//                }
//            }
//            return nil
    }
}


extension RMRequest {
    static let listCharacterRequests = RMRequest(endpoint: .character)
}
