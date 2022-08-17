//
//  ItemCell.swift
//  Coles
//
//  Created by Teja on 10/08/22.
//

import UIKit
import Kingfisher

class ItemCell: UICollectionViewCell, RecipeCellType {
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        recipeImage.image = nil
        recipeTitle.text = ""
        
    }
    
    func configure(cellViewModel: RecipeCellViewModelType) {
        guard let cellViewModel = cellViewModel as? ItemsCellViewModel else { return }
        self.recipeTitle.text = cellViewModel.recipeTitle
        self.recipeImage.kf.setImage(with: cellViewModel.recipeImageURL)
        self.recipeTitle.isAccessibilityElement = true
    }
}

struct ItemsCellViewModel: RecipeCellViewModelType {
    var dealsHomepageViewModelType: RecipeViewModelType
    let recipeTitle: String
    let recipeImageURL: URL
}
