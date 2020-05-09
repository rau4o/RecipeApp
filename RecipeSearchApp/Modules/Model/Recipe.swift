//
//  Recipe.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation

struct Welcome: Decodable {
    let q: String
    let from, to: Int
    let more: Bool
    let count: Int
    let hits: [Hit]
}

struct Hit: Decodable {
    let recipe: Recipe
}

struct Recipe: Decodable {
    let uri: String
    let label: String
    let image: String
    let source: String
    let url: String
    let shareAs: String
    let yield: Int
    let calories: Float
    let totalWeight: Float
    let dietLabels, healthLabels, cautions: [String]
    let ingredientLines: [String]
}
