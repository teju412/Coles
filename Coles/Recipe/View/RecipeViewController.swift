//
//  MainViewController.swift
//  Coles
//
//  Created by Teja on 10/08/22.
//

import UIKit

class RecipeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var recipeVM: RecipeViewModelProtocol = RecipeViewModel()
    
    override func viewDidLoad() {
        registerNib()
        getRecipes(fileName: "recipesSample")
        super.viewDidLoad()
    }
    
    func registerNib() {
        RecipeViewModelType.allCases.forEach {
            collectionView.register(UINib(nibName: $0.nibName, bundle: nil), forCellWithReuseIdentifier: $0.nibName)
        }
        collectionView.collectionViewLayout = (UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight) ? landscapelayout() : potraitlayout()
    }
    func getRecipes(fileName: String) {
        recipeVM.getRecipes(fileName: fileName) {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    private func potraitlayout() -> UICollectionViewCompositionalLayout{
        let size = NSCollectionLayoutSize(
            widthDimension : .fractionalWidth(1),
            heightDimension: .estimated(44)
        )
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)
        group.contentInsets.leading = 10
        group.contentInsets.trailing = 10
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func landscapelayout() -> UICollectionViewCompositionalLayout{
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        switch UIDevice.current.orientation{
        case .landscapeLeft, .landscapeRight:
            collectionView.collectionViewLayout = landscapelayout()
            recipeVM.generateRecipeViewModels(isLandScape: true)
            break
        default:
            collectionView.collectionViewLayout = potraitlayout()
            recipeVM.generateRecipeViewModels(isLandScape: false)
            break
        }
        collectionView.performBatchUpdates(nil)
    }
}


extension RecipeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeVM.recipeViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionValue = recipeVM.recipeViewModel.element(atIndex: indexPath.row),
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sectionValue.dealsHomepageViewModelType.nibName , for: indexPath) as? RecipeCellType
        else { return UICollectionViewCell() }
        cell.configure(cellViewModel: sectionValue)
        return cell
    }
}
