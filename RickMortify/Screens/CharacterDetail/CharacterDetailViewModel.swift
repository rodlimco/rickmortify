//
//  CharacterDetailViewModel.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 14/11/24.
//

import Foundation

class CharacterDetailViewModel: ObservableObject {

    private let charactersRepository: CharactersRepositoryProtocol

    let character: Character
    @Published private(set) var moreCharacters: [Character] = []

    init (
        character: Character,
        charactersRepository: CharactersRepositoryProtocol = CharactersRepository()
    ) {
        self.character = character
        self.charactersRepository = charactersRepository
    }

    @MainActor
    func fetchCharacters() async {
        do {
            let nextFiveCharactersIds: [Int] = Array((character.id + 1)...(character.id + 5))
            moreCharacters = try await charactersRepository.getCharacters(ids: nextFiveCharactersIds)
        } catch {
            moreCharacters.removeAll()
        }
    }
}
