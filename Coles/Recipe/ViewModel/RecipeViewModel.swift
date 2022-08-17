//
//  RecipeViewModel.swift
//  Coles
//
//  Created by Teja on 14/08/22.
//

import Foundation
import UIKit

protocol RecipeViewModelProtocol{
    var recipeViewModel: [RecipeCellViewModelType] { get }
    func generateRecipeViewModels(isLandScape: Bool)
    func getRecipes(fileName: String, completion: @escaping() -> Void)
}

final class RecipeViewModel: RecipeViewModelProtocol {
    var recipeViewModel: [RecipeCellViewModelType]
    var recipes: [Recipe]
    
    init(recipeViewModel: [RecipeCellViewModelType] = [RecipeCellViewModelType](),
         recipes: [Recipe] = [Recipe]()) {
        self.recipeViewModel = recipeViewModel
        self.recipes = recipes
    }
    
    func getRecipes(fileName: String, completion: @escaping () -> Void) {
        var isLandscape: Bool = false
        if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
            isLandscape = true
        }
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(RecipeModel.self, from: data)
                self.recipes = jsonData.recipes
                generateRecipeViewModels(isLandScape: isLandscape)
                completion()
            } catch {
                self.recipes = []
                completion()
            }
        } else {
            self.recipes = []
            completion()
        }
    }
    
    func generateRecipeViewModels(isLandScape: Bool) {
        recipeViewModel = [RecipeCellViewModelType]()
        if isLandScape  {
            recipes.forEach{ recipe in
                recipeViewModel.append(generateItemsViewModel(recipe: recipe))
            }
        } else {
            guard let recipe = self.recipes.element(atIndex: 0) else { return }
            recipeViewModel.append(titleViewModel(recipe: recipe))
            recipeViewModel.append(descriptionViewModel(recipe: recipe))
            recipeViewModel.append(imageViewModel(recipe: recipe))
            recipeViewModel.append(prepViewModel(recipe: recipe))
            recipeViewModel.append(IngredientsViewModel(recipe: recipe))
        }
    }
    
     func titleViewModel(recipe: Recipe) -> RecipeCellViewModelType {
         return TitleCellViewModel(dealsHomepageViewModelType: .title, title: recipe.dynamicTitle ?? "" )
    }
    
     func descriptionViewModel(recipe: Recipe) -> RecipeCellViewModelType {
        return DescriptionCellViewModel(dealsHomepageViewModelType: .description, description: recipe.dynamicDescription ?? "")
    }
    
     func imageViewModel(recipe: Recipe) -> RecipeCellViewModelType {
        return ImageCellViewModel(dealsHomepageViewModelType: .imageCell, recipeImageURL: recipe.imageCacheUrl)
    }
    
     func prepViewModel(recipe: Recipe) -> RecipeCellViewModelType {
        return PreparationCellViewModel(dealsHomepageViewModelType: .preparation, serveTitle: recipe.recipeDetails?.amountLabel ?? "",
                                        serves: String(recipe.recipeDetails?.amountNumber ?? 0),
                                        prepTitle: recipe.recipeDetails?.prepLabel ?? "",
                                        prep: recipe.recipeDetails?.prepTime ?? "",
                                        cookingTitle: recipe.recipeDetails?.cookingLabel ?? "",
                                        cooking: recipe.recipeDetails?.cookingTime ?? "")
    }
    
     func IngredientsViewModel(recipe: Recipe) -> RecipeCellViewModelType {
        return IngredientsCellViewModel(dealsHomepageViewModelType: .ingredients, ingredients: recipe.ingredients ?? [])
    }
    
     func generateItemsViewModel(recipe: Recipe) -> RecipeCellViewModelType {
        return ItemsCellViewModel(dealsHomepageViewModelType: .item, recipeTitle: recipe.dynamicTitle ?? "",
                                  recipeImageURL: recipe.imageCacheUrl)
    }
}
