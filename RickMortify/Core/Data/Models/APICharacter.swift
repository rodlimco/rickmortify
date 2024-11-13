//
//  APICharacter.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

struct APICharacter: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: APILocationInfo
    let location: APILocationInfo
    let image: String
    let url: String
}
