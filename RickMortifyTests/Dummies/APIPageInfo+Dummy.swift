//
//  APIPageInfo+Dummy.swift
//  RickMortifyTests
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation
@testable import RickMortify

extension APIPageInfo {
    static func dummy(
        count: Int = 826,
        pages: Int = 42,
        next: String? = "https://rickandmortyapi.com/api/character?page=2",
        prev: String? = nil
    ) -> APIPageInfo {
        return APIPageInfo(count: count, pages: pages, next: next, prev: prev)
    }
}
