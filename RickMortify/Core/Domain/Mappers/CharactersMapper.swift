//
//  CharactersMapper.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

enum CharactersMapper {

    static func map(characters: [APICharacter]) -> [Character] {
        return characters.map(map(character:))
    }

    static func map(character: APICharacter) -> Character {
        return Character(
            id: character.id,
            name: character.name,
            image: character.image,
            location: character.location.name,
            status: character.status,
            url: character.url
        )
    }
}
