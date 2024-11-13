//
//  CharactersListView.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import SwiftUI

struct CharactersListView: View {

    @StateObject private var viewModel = CharactersListViewModel()

    var body: some View {
        content
            .task {
                await viewModel.fetchCharacters()
            }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .error:
            errorView
        case .loading:
            ProgressView()
        case .success:
            successView
        default:
            EmptyView()
            // TODO: handle other states
        }
    }

    private var errorView: some View {
        VStack {
            Text("Oops! Something went wrong.")
                .multilineTextAlignment(.center)
                .font(.system(size: Constants.errorMessageFontSize, weight: .semibold))
            
            Text("Please try again.")
                .multilineTextAlignment(.center)
                .font(.system(size: Constants.errorMessageFontSize, weight: .thin))

            Button {
                Task {
                    await viewModel.reload()
                }
            } label: {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("Reload")
                }
                .padding()
                .background(Constants.errorButtonBackground)
                .foregroundColor(.white)
                .cornerRadius(Constants.errorButtonCornerRadius)
            }
        }
    }

    private var successView: some View {
        List {
            ForEach(viewModel.characters) { character in
                NavigationLink {
                    CharacterDetailView(character: character)
                } label: {
                    CharacterListItemView(character: character)
                }
            }

            ProgressView()
                .id(UUID())
                .frame(maxWidth: .infinity, alignment: .center)
                .task {
                    await viewModel.fetchCharacters()
                }
        }
        .listStyle(.plain)
        .refreshable {
            await viewModel.reload()
        }
    }
}

private extension CharactersListView {
    enum Constants {
        static let errorButtonBackground: Color = Color.teal.opacity(0.8)
        static let errorButtonCornerRadius: CGFloat = 8.0
        static let errorMessageFontSize: CGFloat = 22.0
    }
}

#Preview {
    CharactersListView()
}
