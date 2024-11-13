//
//  URLSession+.swift
//  RickMortifyTests
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

extension URLSession {
    static var test: URLSession {
        let mockConfiguration = URLSessionConfiguration.default
        mockConfiguration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: mockConfiguration)
    }
}
