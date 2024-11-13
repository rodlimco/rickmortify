//
//  URLSession+.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

extension URLSession {

    func request<T: Decodable>(
        url: URL,
        decoder: JSONDecoder = JSONDecoder()
    ) async throws -> T {
        let (data, _) = try await self.data(from: url)
        return try decoder.decode(T.self, from: data)
    }
}
