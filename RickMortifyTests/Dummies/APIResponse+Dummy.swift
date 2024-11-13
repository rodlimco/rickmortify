//
//  APIResponse+Dummy.swift
//  RickMortifyTests
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation
@testable import RickMortify

extension APIResponse {
    static func dummy(
        info: APIPageInfo = .dummy(),
        results: [T] = []
    ) -> APIResponse {
        return APIResponse(info: info, results: results)
    }
}
