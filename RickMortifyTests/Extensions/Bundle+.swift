//
//  Bundle+.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import Foundation

enum BundleError: Error, Comparable {
    case fileNotFound(String)
}

extension Bundle {

    func loadData(for fileName: String) throws -> Data {

        guard let url = url(forResource: fileName, withExtension: nil) else {
            throw BundleError.fileNotFound("Failed to locate \(fileName) in bundle.")
        }

        return try Data(contentsOf: url)
    }
}
