//
//  CharactersServiceTests.swift
//  RickMortifyTests
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import XCTest
@testable import RickMortify

final class CharactersServiceTests: XCTestCase {

    var urlSession: URLSession!
    var charactersService: CharactersServiceable!

    override func setUp() {
        urlSession = .test
        charactersService = CharactersService(urlSession: urlSession)
    }

    override func tearDown() {
        urlSession = nil
        charactersService = nil
    }

    func test_GetCharactersForPage_Success() async throws {
        let mockData: Data = try TestsBundle.test.loadData(for: StubsType.charactersResponse.filename)

        MockURLProtocol.requestHandler = { _ in
            (HTTPURLResponse(), mockData)
        }

        let apiResponse: APIResponse<APICharacter> = try await charactersService.getCharacters(page: 1)
        XCTAssertFalse(apiResponse.results.isEmpty)
        XCTAssertTrue(apiResponse.results.count == 5)
    }
    
    func test_GetCharactersForPage_ThrowsError() async throws {
        let expectation = urlResponseExpectation(data: nil)

        do {
            let apiResponse: APIResponse<APICharacter> = try await charactersService.getCharacters(page: 1)
            XCTFail("Unexpected value: \(apiResponse)")
        } catch {

        }

        await fulfillment(of: [expectation], timeout: 0.1)
    }
    
    func test_GetCharactersById_Success() async throws {
        let mockData: Data = try TestsBundle.test.loadData(for: StubsType.characters.filename)

        MockURLProtocol.requestHandler = { _ in
            (HTTPURLResponse(), mockData)
        }

        let apiResponse: [APICharacter] = try await charactersService.getCharacters(ids: [])
        XCTAssertFalse(apiResponse.isEmpty)
    }
    
    func test_GetCharactersById_ThrowsError() async throws {
        let expectation = urlResponseExpectation(data: nil)

        do {
            let apiResponse: [APICharacter] = try await charactersService.getCharacters(ids: [])
            XCTFail("Unexpected value: \(apiResponse)")
        } catch {

        }

        await fulfillment(of: [expectation], timeout: 0.1)
    }
    
    func test_GetCharacterDetail_Success() async throws {
        let mockData: Data = try TestsBundle.test.loadData(for: StubsType.characterDetail.filename)

        MockURLProtocol.requestHandler = { _ in
            (HTTPURLResponse(), mockData)
        }

        let apiCharacter: APICharacter = try await charactersService.getCharacterDetail(id: 1)
        XCTAssertNotNil(apiCharacter)
        XCTAssertEqual(apiCharacter.id, 1)
    }
    
    func test_GetCharacterDetail_ThrowsError() async throws {
        let expectation = urlResponseExpectation(data: nil)

        do {
            let apiCharacter: APICharacter = try await charactersService.getCharacterDetail(id: 1)
            XCTFail("Unexpected value: \(apiCharacter)")
        } catch {

        }

        await fulfillment(of: [expectation], timeout: 0.1)
    }

    private func urlResponseExpectation(
        data: Data?,
        response: HTTPURLResponse = .init()
    ) -> XCTestExpectation {
        let urlResponseExpectation = expectation(description: "urlResponseExpectation")
        MockURLProtocol.requestHandler = { _ in
            urlResponseExpectation.fulfill()
            guard let data else { throw MockError.💣 }
            return (response, data)
        }
        return urlResponseExpectation
    }
}
