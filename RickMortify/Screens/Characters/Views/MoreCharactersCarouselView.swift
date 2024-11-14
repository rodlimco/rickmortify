//
//  MoreCharactersCarouselView.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 14/11/24.
//

import SwiftUI

struct MoreCharactersCarouselView: View {

    let characters: [Character]

    var body: some View {
        if !characters.isEmpty {
            content
        }
    }

    private var content: some View {
        VStack(
            alignment: .leading,
            spacing: Constants.spacingEight
        ) {
            Text("Related Characters")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: Constants.spacingEight) {
                    ForEach(characters) { character in
                        characterCard(character)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func characterCard(_ character: Character) -> some View {
        NavigationLink {
            CharacterDetailView(viewModel: .init(character: character))
        } label: {
            VStack(spacing: Constants.spacingEight) {
                CharacterImage(
                    image: character.image,
                    imageSize: .init(width: Constants.imageSize.width, height: Constants.imageSize.height),
                    cornerRadius: Constants.cornerRadius
                )
                
                Text(character.name.capitalized)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .font(.system(size: Constants.nameFontSize, weight: .semibold))
            }
            .padding(Constants.paddingFour)
            .frame(width: Constants.cardFrameWidth)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color.white.cornerRadius(Constants.cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .stroke(Color.borderColor, lineWidth: Constants.borderWidth)
            )
        }
    }
}

private extension MoreCharactersCarouselView {
    enum Constants {
        static let borderWidth: CGFloat = 1.0
        static let cardBackgroundColor: Color = Color.gray.opacity(0.1)
        static let cornerRadius: CGFloat = 12.0
        static let cardFrameWidth: CGFloat = 116.0
        static let nameFontSize: CGFloat = 12.0
        static let paddingFour: CGFloat = 8.0
        static let spacingEight: CGFloat = 8.0
        static let imageSize: CGSize = CGSize(width: 100.0, height: 100.0)
    }
}

#Preview {
    MoreCharactersCarouselView(
        characters: [
            .init(
                id: UUID().hashValue,
                name: "Morty Smith",
                image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                location: "Citadel of Ricks",
                status: "Alive",
                url: "https://rickandmortyapi.com/api/character/2"
            ),
            .init(
                id: UUID().hashValue,
                name: "Morty Smith",
                image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                location: "Citadel of Ricks",
                status: "Alive",
                url: "https://rickandmortyapi.com/api/character/2"
            ),
            .init(
                id: UUID().hashValue,
                name: "Morty Smith",
                image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                location: "Citadel of Ricks",
                status: "Alive",
                url: "https://rickandmortyapi.com/api/character/2"
            )
        ]
    )
}
