//
//  SearchModel.swift
//  RecipesCodingChallenge
//
//  Created by Ilya Shytsko on 15.03.24.
//

import Foundation

struct SearchModel: Decodable, Hashable {
    let hits: [Hit]
}

extension SearchModel {
    struct Hit: Decodable, Hashable {
        let recipe: Recipe
    }

    struct Recipe: Decodable, Hashable {
        let label: String?
        let image: String?
    }
}

