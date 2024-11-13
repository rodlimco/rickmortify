//
//  URLBuilder.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

enum URLBuilder {
    static func create(
        path: EndpointPath,
        queryItems: [URLQueryItem]? = nil
    ) throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        components.path = path.stringLiteral
        components.queryItems = queryItems
        
        guard let url = components.url else {
            throw NetworkError.invalidUrl
        }
        
        return url
    }
}

extension URLBuilder {
    enum EndpointPath {
        case character
        case detail(entity: EntityType, id: Int)
        case episode
        case location

        var stringLiteral: String {
            switch self {
            case .character:
                return "/api/character"
            case .detail(let entity, let id):
                return "/api/\(entity.rawValue)/\(id.toString)"
            case .episode:
                return "/api/episode"
            case .location:
                return "/api/location"
            }
        }
    }

    enum EntityType: String {
        case character
        case episode
        case location
    }
}
