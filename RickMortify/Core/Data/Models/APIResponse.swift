//
//  APIResponse.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

struct APIResponse<T: Decodable>: Decodable {
    let info: APIPageInfo
    let results: [T]
}
