//
//  ExtensionCollectionView.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 04.09.2021.
//

import UIKit

// MARK: - Extension
extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenSize.width / 2 - 5, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.jsonCellViewModels.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailViewController(forClothes: viewModel.getCellViewModel(at: indexPath))
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CustomCell.self), for: indexPath) as! CustomCell
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        cell.backgroundColor = .white
        return cell
    }
}

