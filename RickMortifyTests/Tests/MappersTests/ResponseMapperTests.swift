//
//  ResponseMapperTests.swift
//  RickMortifyTests
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import XCTest
@testable import RickMortify

final class ResponseMapperTests: XCTestCase {

    func test_MapAPIResponseToPagedResponse_ReturnsExpectedPagedResponse() {

        let apiCharacters: [APICharacter] = [
            APICharacter.dummy(id: 1, name: "Rick Sanchez"),
            APICharacter.dummy(id: 2, name: "Morty Smith")
        ]

        let apiPageInfo: APIPageInfo = APIPageInfo.dummy()

        let apiResponse: APIResponse = APIResponse(
            info: apiPageInfo,
            results: apiCharacters
        )

        let pagedResponse: PagedResponse = ResponseMapper.map(
            apiResponse: apiResponse,
            transform: CharactersMapper.map(character:)
        )

        XCTAssertEqual(pagedResponse.info.count, apiPageInfo.count)
        XCTAssertEqual(pagedResponse.info.pages, apiPageInfo.pages)
        XCTAssertEqual(pagedResponse.info.next, apiPageInfo.next)
        XCTAssertEqual(pagedResponse.info.prev, apiPageInfo.prev)

        XCTAssertEqual(pagedResponse.results.count, apiCharacters.count)
        XCTAssertEqual(pagedResponse.results[0].id, apiCharacters[0].id)
        XCTAssertEqual(pagedResponse.results[0].name, apiCharacters[0].name)
        XCTAssertEqual(pagedResponse.results[1].id, apiCharacters[1].id)
        XCTAssertEqual(pagedResponse.results[1].name, apiCharacters[1].name)
    }

    func test_MapPageInfo_ReturnsExpectedPageInfo() {

        let apiPageInfo: APIPageInfo = APIPageInfo.dummy()

        let pageInfo: PageInfo = ResponseMapper.map(pageInfo: apiPageInfo)

        XCTAssertEqual(pageInfo.count, apiPageInfo.count)
        XCTAssertEqual(pageInfo.pages, apiPageInfo.pages)
        XCTAssertEqual(pageInfo.next, apiPageInfo.next)
        XCTAssertEqual(pageInfo.prev, apiPageInfo.prev)
    }
}
