//
//  CharactersRepository.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

protocol CharactersRepositoryProtocol {
    func getCharacters(page: Int) async throws -> [Character]
    func getCharacterDetail(id: Int) async throws -> Character
}

class CharactersRepository: CharactersRepositoryProtocol {

    private let service: CharactersServiceable

    init(service: CharactersServiceable = CharactersService()) {
        self.service = service
    }

    func getCharacters(page: Int) async throws -> [Character] {
        let response: APIResponse<APICharacter> = try await service.getCharacters(page: page)
        return ResponseMapper.map(
            apiResponse: response,
            transform: CharactersMapper.map(character:)
        ).results
    }

    func getCharacterDetail(id: Int) async throws -> Character {
        let response: APICharacter = try await service.getCharacterDetail(id: id)
        return CharactersMapper.map(character: response)
    }
}
