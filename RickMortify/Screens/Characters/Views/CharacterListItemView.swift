//
//  CharacterListItemView.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import SwiftUI

struct CharacterListItemView: View {

    let character: Character

    var body: some View {
        content
    }

    private var content: some View {
        HStack(spacing: Constants.horizontalSpacing) {
            CharacterImage(image: character.image, imageSize: Constants.imageSize, cornerRadius: Constants.cornerRadius)
            characterInfo
        }
    }

    private var characterInfo: some View {
        VStack(
            alignment: .leading,
            spacing: Constants.verticalSpacing
        ) {
            Text(character.name.capitalized)
                .font(.system(size: Constants.nameFontSize, weight: .semibold))
            Text(character.status.capitalized)
                .font(.system(size: Constants.typesFontSize, weight: .thin))
        }
    }
}

private extension CharacterListItemView {
    enum Constants {
        static let cornerRadius: CGFloat = 20.0
        static let nameFontSize: CGFloat = 16.0
        static let horizontalSpacing: CGFloat = 10.0
        static let typesFontSize: CGFloat = 12.0
        static let verticalSpacing: CGFloat = 4.0
        static let imageSize: CGSize = .init(width: 50.0, height: 50.0)
    }
}

#Preview {
    CharacterListItemView(
        character: .init(
            id: UUID().hashValue,
            name: "Morty Smith",
            image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            location: "Citadel of Ricks",
            status: "Alive",
            url: "https://rickandmortyapi.com/api/character/2"
        )
    )
}
