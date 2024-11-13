//
//  ImagePlaceholder.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import SwiftUI

struct ImagePlaceholder: View {

    let size: CGSize
    
    var body: some View {
        Image("placeholder")
            .resizable()
            .scaledToFit()
            .frame(width: size.width, height: size.height)
    }
}

#Preview {
    ImagePlaceholder(size: .init(width: 50, height: 50))
}
