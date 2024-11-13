//
//  CharactersListViewModelTests.swift
//  RickMortifyTests
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import XCTest
@testable import RickMortify

final class CharactersListViewModelTests: XCTestCase {

    var characterstService: CharactersServiceMock!
    var charactersRepository: CharactersRepositoryProtocol!
    var viewModel: CharactersListViewModel!

    override func setUp() {
        characterstService = CharactersServiceMock()
        charactersRepository = CharactersRepository(service: characterstService)
        viewModel = CharactersListViewModel(charactersRepository: charactersRepository)
    }

    override func tearDown() {
        characterstService = nil
        charactersRepository = nil
        viewModel = nil
    }

    func test_FetchCharacters_SuccessfullyUpdatesStateAndCharacters() async {

        let apiResponse: APIResponse<APICharacter> = .dummy(
            info: .dummy(),
            results: [.dummy()]
        )

        characterstService.getCharactersClosure = { _ in apiResponse }

        await viewModel.fetchCharacters()

        XCTAssertEqual(viewModel.state, .success)
        XCTAssertEqual(viewModel.characters.count, 1)
        XCTAssertEqual(viewModel.characters.first!.name, "Rick Sanchez")
    }
    
    func test_FetchCharacters_FailureUpdatesStateAndClearsCharacters() async {
        characterstService.getCharactersClosure = { _ in throw NetworkError.invalidRequest }

        await viewModel.fetchCharacters()

        XCTAssertEqual(viewModel.state, .error)
        XCTAssertTrue(viewModel.characters.isEmpty)
    }
    
    func test_Reload_ResetsStateAndCharacters() async {
        let apiResponse: APIResponse<APICharacter> = .dummy(
            info: .dummy(),
            results: [.dummy()]
        )

        characterstService.getCharactersClosure = { _ in apiResponse }

        await viewModel.reload()
    
        XCTAssertEqual(viewModel.state, .success)
        XCTAssertFalse(viewModel.characters.isEmpty)
    }
}
