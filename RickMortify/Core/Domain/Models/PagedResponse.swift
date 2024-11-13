//
//  PagedResponse.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

struct PagedResponse<T> {
    let info: PageInfo
    let results: [T]
}
