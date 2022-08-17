//
//  DescriptionCell.swift
//  Coles
//
//  Created by Teja on 14/08/22.
//

import UIKit

class DescriptionCell: UICollectionViewCell, RecipeCellType {
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(cellViewModel: RecipeCellViewModelType) {
        guard let cellViewModel = cellViewModel as? DescriptionCellViewModel else { return }
        descriptionLbl.text = cellViewModel.description
    }
}

struct DescriptionCellViewModel: RecipeCellViewModelType {
    var dealsHomepageViewModelType: RecipeViewModelType
    let description: String
}

