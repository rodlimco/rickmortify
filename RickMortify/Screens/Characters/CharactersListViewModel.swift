//
//  CharactersListViewModel.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

class CharactersListViewModel: ObservableObject {
    
    private let charactersRepository: CharactersRepositoryProtocol
    private var currentPage: Int = 1

    @Published private(set) var state: ViewState = .loading
    @Published private(set) var characters: [Character] = []
    
    init (charactersRepository: CharactersRepositoryProtocol = CharactersRepository()) {
        self.charactersRepository = charactersRepository
    }

    @MainActor
    func fetchCharacters() async {
        do {
            let fetchedCharacters: [Character] = try await charactersRepository.getCharacters(page: currentPage)
            characters += fetchedCharacters
            currentPage += 1
            state = .success
        } catch {
            characters.removeAll()
            currentPage = 1
            state = .error
        }
    }
    
    @MainActor
    func reload() async {
        if state != .loading {
            state = .loading
        }
        
        characters.removeAll()
        currentPage = 1
        await fetchCharacters()
    }
}
