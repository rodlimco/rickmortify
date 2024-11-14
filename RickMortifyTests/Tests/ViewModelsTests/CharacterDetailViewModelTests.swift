//
//  CharacterDetailViewModelTests.swift
//  RickMortifyTests
//
//  Created by Rodrigo Limpias Cossio on 14/11/24.
//

import XCTest
@testable import RickMortify

final class CharacterDetailViewModelTests: XCTestCase {

    var charactersService: CharactersServiceMock!
    var charactersRepository: CharactersRepositoryProtocol!
    var viewModel: CharacterDetailViewModel!
    var testCharacter: Character!

    override func setUp() {
        charactersService = CharactersServiceMock()
        charactersRepository = CharactersRepository(service: charactersService)

        testCharacter = Character(
            id: UUID().hashValue,
            name: "Morty Smith",
            image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            location: "Citadel of Ricks",
            status: "Alive",
            url: "https://rickandmortyapi.com/api/character/2"
        )

        viewModel = CharacterDetailViewModel(
            character: testCharacter,
            charactersRepository: charactersRepository
        )
    }

    override func tearDown() {
        charactersService = nil
        charactersRepository = nil
        viewModel = nil
        testCharacter = nil
    }

    func test_FetchCharacters_SuccessfullyUpdatesMoreCharacters() async {
        let relatedCharacters: [APICharacter] = [
            .dummy(id: 2, name: "Rick Sanchez"),
            .dummy(id: 3, name: "Summer Smith"),
            .dummy(id: 4, name: "Beth Smith"),
            .dummy(id: 5, name: "Morty Smith"),
            .dummy(id: 6, name: "Birdperson"),
        ]

        charactersService.getCharactersWithIdsClosure = { _ in
            relatedCharacters
        }

        await viewModel.fetchCharacters()
        
        XCTAssertEqual(viewModel.moreCharacters.count, 5)
        XCTAssertEqual(viewModel.moreCharacters[0].name, "Rick Sanchez")
        XCTAssertEqual(viewModel.moreCharacters[1].name, "Summer Smith")
        XCTAssertEqual(viewModel.moreCharacters[2].name, "Beth Smith")
        XCTAssertEqual(viewModel.moreCharacters[3].name, "Morty Smith")
        XCTAssertEqual(viewModel.moreCharacters[4].name, "Birdperson")
        
    }

    func test_FetchCharacters_FailureClearsMoreCharacters() async {
        charactersService.getCharactersWithIdsClosure = { _ in throw NetworkError.invalidRequest }

        await viewModel.fetchCharacters()

        XCTAssertTrue(viewModel.moreCharacters.isEmpty)
    }
}
