//
//  APICharacter+Dummy.swift
//  RickMortifyTests
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation
@testable import RickMortify

extension APICharacter {
    static func dummy(
        id: Int = UUID().hashValue,
        name: String = "Rick Sanchez",
        status: String = "Alive",
        species: String = "Human",
        gender: String = "Male",
        origin: APILocationInfo = .dummy(name: "Earth (C-137)"),
        location: APILocationInfo = .dummy(name: "Citadel of Ricks"),
        image: String = "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        url: String = "https://rickandmortyapi.com/api/character/1"
    ) -> APICharacter {
        return APICharacter(
            id: id,
            name: name,
            status: status,
            species: species,
            gender: gender,
            origin: origin,
            location: location,
            image: image,
            url: url
        )
    }
}
