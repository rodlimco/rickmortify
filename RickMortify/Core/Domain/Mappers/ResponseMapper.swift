//
//  ResponseMapper.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

enum ResponseMapper {

    static func map<U, V>(
        apiResponse: APIResponse<U>,
        transform: (U) -> V
    ) -> PagedResponse<V> {
        return PagedResponse(
            info: map(pageInfo: apiResponse.info),
            results: apiResponse.results.map(transform)
        )
    }

    static func map(pageInfo: APIPageInfo) -> PageInfo {
        PageInfo(
            count: pageInfo.count,
            pages: pageInfo.pages,
            next: pageInfo.next,
            prev: pageInfo.prev
        )
    }
}
