//
//  ExtensionCollectionView.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 04.09.2021.
//

import UIKit

// MARK: - Extension
extension FirstViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.jsonCellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CustomCollectionViewCell.self), for: indexPath) as! CustomCollectionViewCell
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        cell.backgroundColor = .white
        return cell
    }
}

extension FirstViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailViewController(forClothes: viewModel.getCellViewModel(at: indexPath))
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension FirstViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenSize.width / 2 - 5, height: 350)
    }
}
