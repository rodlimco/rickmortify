//
//  ViewState.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

enum ViewState: Equatable {
    case empty
    case error
    case loading
    case success
}

extension ViewState {
    var isLoading: Bool {
        self == .loading
    }

    var isEmpty: Bool {
        self == .empty
    }
}
