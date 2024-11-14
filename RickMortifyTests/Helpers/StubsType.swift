//
//  StubsType.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

enum StubsType {
    
    case characters
    case characterDetail
    case charactersResponse
    
    var filename: String {
        switch self {
        case .characters: return "APICharacters.json"
        case .characterDetail: return "APICharacterDetail.json"
        case .charactersResponse: return "APICharactersResponse.json"
        }
    }
}
