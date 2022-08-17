//
//  IngredientsCell.swift
//  Coles
//
//  Created by Teja on 14/08/22.
//

import UIKit

class IngredientsCell: UICollectionViewCell, RecipeCellType {
    
    @IBOutlet weak var ingredientsLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(cellViewModel: RecipeCellViewModelType) {
        guard let cellViewModel = cellViewModel as? IngredientsCellViewModel else { return }
        var ingredientsText = ""
        for ing in cellViewModel.ingredients {
            ingredientsText.append("\u{003E} \(ing.ingredient ?? "")\n")
        }
        self.ingredientsLbl.text = ingredientsText
    }
    
}


struct IngredientsCellViewModel: RecipeCellViewModelType {
    var dealsHomepageViewModelType: RecipeViewModelType
    let ingredients: [Ingredient]
}
