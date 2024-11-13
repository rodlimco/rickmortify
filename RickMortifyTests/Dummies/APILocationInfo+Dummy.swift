//
//  APILocationInfo+Dummy.swift
//  RickMortifyTests
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation
@testable import RickMortify

extension APILocationInfo {
    static func dummy(name: String = "Earth (C-137)") -> APILocationInfo {
        return APILocationInfo(name: name)
    }
}
