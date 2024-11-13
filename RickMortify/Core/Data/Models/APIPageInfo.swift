//
//  APIPageInfo.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

struct APIPageInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
