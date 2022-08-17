//
//  PreparationCell.swift
//  Coles
//
//  Created by Teja on 14/08/22.
//

import UIKit

class PreparationCell: UICollectionViewCell, RecipeCellType {
    @IBOutlet weak var serveTitleLbl: UILabel!
    @IBOutlet weak var servesLbl: UILabel!
    @IBOutlet weak var prepTitleLbl: UILabel!
    @IBOutlet weak var prepLbl: UILabel!
    @IBOutlet weak var cookingTitleLbl: UILabel!
    @IBOutlet weak var cookingLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(cellViewModel: RecipeCellViewModelType) {
        guard let cellViewModel = cellViewModel as? PreparationCellViewModel else { return }
        serveTitleLbl.text = cellViewModel.serveTitle
        servesLbl.text = cellViewModel.serves
        prepTitleLbl.text = cellViewModel.prepTitle
        prepLbl.text = cellViewModel.prep
        cookingTitleLbl.text = cellViewModel.cookingTitle
        cookingLbl.text = cellViewModel.cooking
    }
    
}

struct PreparationCellViewModel: RecipeCellViewModelType {
    var dealsHomepageViewModelType: RecipeViewModelType
    let serveTitle: String
    let serves: String
    let prepTitle: String
    let prep: String
    let cookingTitle: String
    let cooking: String
}
