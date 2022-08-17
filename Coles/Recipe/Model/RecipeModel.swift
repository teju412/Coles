//
//  RecipeModel.swift
//  Coles
//
//  Created by Teja on 10/08/22.
//

import Foundation

struct RecipeModel: Codable{
    let recipes: [Recipe]
}

struct Recipe: Codable{
    let dynamicTitle: String?
    let dynamicDescription: String?
    let dynamicThumbnail: String?
    let dynamicThumbnailAlt: String?
    let recipeDetails: RecipeDetail?
    let ingredients: [Ingredient]?
    
    var imageCacheUrl: URL!{
        URL(string: "https://coles.com.au/\(dynamicThumbnail ?? "")")
    }
}

struct RecipeDetail: Codable{
    let amountLabel: String?
    let amountNumber: Int?
    let prepLabel: String?
    let prepTime: String?
    let prepNote: String?
    let cookingLabel: String?
    let cookingTime: String?
    let cookTimeAsMinutes: Int?
    let prepTimeAsMinutes: Int?
}

struct Ingredient: Codable{
    let ingredient: String?
}

