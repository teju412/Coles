//
//  ImageCell.swift
//  Coles
//
//  Created by Teja on 14/08/22.
//

import UIKit
import Kingfisher

class ImageCell: UICollectionViewCell, RecipeCellType {
    
    @IBOutlet weak var recipeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(cellViewModel: RecipeCellViewModelType) {
        guard let cellViewModel = cellViewModel as? ImageCellViewModel else { return }
        recipeImage.kf.setImage(with: cellViewModel.recipeImageURL)
    }
    
}

struct ImageCellViewModel: RecipeCellViewModelType {
    var dealsHomepageViewModelType: RecipeViewModelType
    let recipeImageURL: URL
}

