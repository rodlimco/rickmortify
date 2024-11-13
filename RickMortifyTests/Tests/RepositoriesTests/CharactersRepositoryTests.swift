//
//  CharactersRepositoryTests.swift
//  RickMortifyTests
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import XCTest
@testable import RickMortify

final class CharactersRepositoryTests: XCTestCase {

    var characterstService: CharactersServiceMock!
    var charactersRepository: CharactersRepositoryProtocol!

    override func setUp() {
        characterstService = CharactersServiceMock()
        charactersRepository = CharactersRepository(service: characterstService)
    }

    override func tearDown() {
        characterstService = nil
        charactersRepository = nil
    }

    func test_GetCharacters_Success() async throws {
        let apiResponse: APIResponse<APICharacter> = .dummy(
            info: .dummy(),
            results: [.dummy()]
        )

        characterstService.getCharactersClosure = { _ in apiResponse }

        let characters: [Character] = try await charactersRepository.getCharacters(page: 1)
        XCTAssertFalse(characters.isEmpty)
        XCTAssertEqual(characters.count, 1)
    }
    
    func test_GetCharacters_ThrowsError() async throws {
        characterstService.getCharactersClosure = { _ in throw NetworkError.invalidRequest }

        let throwingExpectation = expectation(description: "throwingExpectation")

        do {
            let characters: [Character] = try await charactersRepository.getCharacters(page: 1)
            XCTFail("Unexpected value: \(characters)")
        } catch {
            throwingExpectation.fulfill()
        }

        await fulfillment(of: [throwingExpectation], timeout: 0.1)
    }
    
    func test_GetCharacterDetail_Success() async throws {
        let apiResponse: APICharacter = .dummy()

        characterstService.getCharacterDetailClosure = { _ in apiResponse }

        let character: Character = try await charactersRepository.getCharacterDetail(id: 1)
        XCTAssertEqual(character.id, apiResponse.id)
        XCTAssertEqual(character.name, apiResponse.name)
    }

    func test_GetCharacterdetail_ThrowsError() async throws {
        characterstService.getCharacterDetailClosure = { _ in throw NetworkError.invalidRequest }

        let throwingExpectation = expectation(description: "throwingExpectation")

        do {
            let character = try await charactersRepository.getCharacterDetail(id: 1)
            XCTFail("Unexpected value: \(character)")
        } catch {
            throwingExpectation.fulfill()
        }

        await fulfillment(of: [throwingExpectation], timeout: 0.1)
    }
}
