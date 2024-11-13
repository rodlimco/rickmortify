//
//  CharactersMapperTests.swift
//  RickMortifyTests
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import XCTest
@testable import RickMortify

final class CharactersMapperTests: XCTestCase {

    func test_MapCharacter_ReturnsExpectedCharacter() {

        let apiCharacter: APICharacter = APICharacter.dummy()

        let domainCharacter: Character = CharactersMapper.map(character: apiCharacter)

        XCTAssertEqual(domainCharacter.id, apiCharacter.id)
        XCTAssertEqual(domainCharacter.name, apiCharacter.name)
        XCTAssertEqual(domainCharacter.image, apiCharacter.image)
        XCTAssertEqual(domainCharacter.location, apiCharacter.location.name)
        XCTAssertEqual(domainCharacter.status, apiCharacter.status)
        XCTAssertEqual(domainCharacter.url, apiCharacter.url)
    }

    func test_MapCharacters_ReturnsExpectedCharactersArray() {
        let apiCharacters: [APICharacter] = [
            APICharacter.dummy(id: 1, name: "Rick Sanchez"),
            APICharacter.dummy(id: 2, name: "Morty Smith"),
            APICharacter.dummy(id: 3, name: "Summer Smith")
        ]

        let characters: [Character] = CharactersMapper.map(characters: apiCharacters)

        XCTAssertEqual(characters.count, apiCharacters.count)
        XCTAssertEqual(characters[0].id, apiCharacters[0].id)
        XCTAssertEqual(characters[0].name, apiCharacters[0].name)
        XCTAssertEqual(characters[1].id, apiCharacters[1].id)
        XCTAssertEqual(characters[1].name, apiCharacters[1].name)
        XCTAssertEqual(characters[2].id, apiCharacters[2].id)
        XCTAssertEqual(characters[2].name, apiCharacters[2].name)
    }
}
