//
//  TitleCell.swift
//  Coles
//
//  Created by Teja on 14/08/22.
//

import UIKit

class TitleCell: UICollectionViewCell, RecipeCellType {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(cellViewModel: RecipeCellViewModelType) {
        guard let cellViewModel = cellViewModel as? TitleCellViewModel else { return }
        titleLbl.text = cellViewModel.title
    }
}

struct TitleCellViewModel: RecipeCellViewModelType {
    var dealsHomepageViewModelType: RecipeViewModelType
    let title: String
}
