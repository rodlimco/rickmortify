//
//  CharacterDetailView.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import SwiftUI

struct CharacterDetailView: View {

    @StateObject var viewModel: CharacterDetailViewModel

    var body: some View {
        content
            .task {
                await viewModel.fetchCharacters()
            }
    }

    private var content: some View {
        ScrollView {
            VStack(
                alignment: .center,
                spacing: .zero
            ) {
                characterImage
                characterName
                characterInfo
                MoreCharactersCarouselView(characters: viewModel.moreCharacters)
            }
            .padding(Constants.paddingSixteen)
        }
        .background(Color.backgroundColor)
    }

    private var characterImage: some View {
        CharacterImage(
            image: viewModel.character.image,
            imageSize: Constants.imageSize,
            cornerRadius: Constants.cornerRadius
        )

        .padding(.bottom, Constants.paddingSixteen)
    }

    private var characterName: some View {
        Text(viewModel.character.name.capitalized)
            .font(.system(size: Constants.nameFontSize, weight: .semibold))
            .padding(.bottom, Constants.paddingSixteen)
    }

    private var characterInfo: some View {
        VStack(
            alignment: .leading,
            spacing: Constants.spacingEight
        ) {
            sectionBuilder(section: "Status", content: viewModel.character.status)
            sectionBuilder(section: "Location", content: viewModel.character.location)
        }
        .padding(.bottom, Constants.paddingTwentyFour)
    }

    private func sectionBuilder(section: String, content: String) -> some View {
        HStack(alignment: .center, spacing: Constants.spacingEight) {
            Text("\(section):")
                .font(.system(size: Constants.contentFontSize, weight: .semibold))
            Text(content.capitalized)
                .font(.system(size: Constants.contentFontSize, weight: .regular))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private extension CharacterDetailView {
    enum Constants {
        static let cornerRadius: CGFloat = 20.0
        static let contentFontSize: CGFloat = 18.0
        static let nameFontSize: CGFloat = 24.0
        static let paddingSixteen: CGFloat = 16.0
        static let paddingTwentyFour: CGFloat = 24.0
        static let spacingEight: CGFloat = 8.0
        static let imageSize: CGSize = .init(width: UIScreen.main.bounds.width - 40.0, height: UIScreen.main.bounds.width - 40.0)
    }
}

#Preview {
    CharacterDetailView(
        viewModel: .init(
            character: .init(
                id: UUID().hashValue,
                name: "Morty Smith",
                image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                location: "Citadel of Ricks",
                status: "Alive",
                url: "https://rickandmortyapi.com/api/character/2"
            )
        )
    )
}
