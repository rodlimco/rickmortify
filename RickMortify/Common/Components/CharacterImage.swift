//
//  CharacterImage.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import SwiftUI

struct CharacterImage: View {

    let image: String
    let imageSize: CGSize
    let cornerRadius: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: image)) { state in
            switch state {
            case .failure:
                ImagePlaceholder(size: imageSize)
            case .success(let image):
                image
                    .resizable()
            default:
                ProgressView()
            }
        }
        .frame(width: imageSize.width, height: imageSize.height)
        .clipShape(.rect(cornerRadius: cornerRadius))
    }
}

#Preview {
    CharacterImage(
        image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
        imageSize: .init(width: 50.0, height: 50.0),
        cornerRadius: 20
    )
}
