//
//  Collection.swift
//  RecipesCodingChallenge
//
//  Created by Ilya Shytsko on 15.03.24.
//

import Foundation

extension Collection {
    var isNotEmpty: Bool { !isEmpty }
}

extension Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool { self?.isEmpty ?? true }
}
