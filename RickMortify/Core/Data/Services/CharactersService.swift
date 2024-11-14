//
//  CharactersService.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

protocol CharactersServiceable {
    func getCharacters(page: Int?) async throws -> APIResponse<APICharacter>
    func getCharacters(ids: [Int]) async throws -> [APICharacter]
    func getCharacterDetail(id: Int) async throws -> APICharacter
}

class CharactersService: CharactersServiceable {

    private let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func getCharacters(page: Int? = nil) async throws -> APIResponse<APICharacter> {
        var queryItems: [URLQueryItem] = []
        if let page {
            queryItems.append(.init(name: .page, value: page.toString))
        }

        let url: URL = try URLBuilder.create(path: .character, queryItems: queryItems)
        return try await urlSession.request(url: url)
    }
    
    func getCharacters(ids: [Int]) async throws -> [APICharacter] {
        let url = try URLBuilder.create(path: .multiple(entity: .character, ids: ids))
        return try await urlSession.request(url: url)
    }

    func getCharacterDetail(id: Int) async throws -> APICharacter {
        let url = try URLBuilder.create(path: .detail(entity: .character, id: id))
        return try await urlSession.request(url: url)
    }
}
