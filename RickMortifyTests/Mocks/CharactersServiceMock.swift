//
//  CharactersServiceMock.swift
//  RickMortifyTests
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation
@testable import RickMortify

final class CharactersServiceMock: CharactersServiceable {

    var getCharactersClosure: ((Int?) async throws -> APIResponse<APICharacter>)!
    func getCharacters(page: Int?) async throws -> APIResponse<APICharacter> {
        try await getCharactersClosure(page)
    }
    
    var getCharactersWithIdsClosure: (([Int]) async throws -> [APICharacter])!
    func getCharacters(ids: [Int]) async throws -> [APICharacter] {
        try await getCharactersWithIdsClosure(ids)
    }

    var getCharacterDetailClosure: ((Int) async throws -> APICharacter)!
    func getCharacterDetail(id: Int) async throws -> APICharacter {
        try await getCharacterDetailClosure(id)
    }
}
