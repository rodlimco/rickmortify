//
//  URLQueryItem+.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

extension URLQueryItem {
    init(name: PaginationQueryItem, value: String?) {
        self.init(name: name.rawValue, value: value)
    }
}
