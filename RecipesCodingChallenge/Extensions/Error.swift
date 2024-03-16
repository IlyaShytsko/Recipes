//
//  Error.swift
//  RecipesCodingChallenge
//
//  Created by Ilya Shytsko on 15.03.24.
//

import Foundation

extension Error {
    var description: String {
        if let networkError = self as? NetworkServiceError {
            return networkError.description
        }
        return self.localizedDescription
    }
}
