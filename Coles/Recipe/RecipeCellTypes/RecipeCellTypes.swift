//
//  RecipeViewModelTypes.swift
//  Coles
//
//  Created by Teja on 14/08/22.
//

import UIKit

enum RecipeViewModelType: String, CaseIterable {
  case title
  case item
  case description
  case imageCell
  case preparation
  case ingredients
  case emptycell
  
  var nibName: String {
    switch self {
    case .title: return "TitleCell"
    case .item: return "ItemCell"
    case .description: return "DescriptionCell"
    case .imageCell: return "ImageCell"
    case .preparation: return "PreparationCell"
    case .ingredients: return "IngredientsCell" 
    case .emptycell: return "EmptyCell"
    }
  }
}

protocol RecipeCellViewModelType {
  var dealsHomepageViewModelType: RecipeViewModelType { get set }
}

protocol RecipeCellType: UICollectionViewCell {
  func configure(cellViewModel: RecipeCellViewModelType)
}
