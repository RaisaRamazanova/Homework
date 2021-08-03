//
//  CatalogViewController.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit

class CatalogViewController: UITabBarController {

    var collectionView: UICollectionView!

    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        collectionView = UICollectionView(frame: CGRect(x: 100, y: 100, width: 50, height: 50), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CatalogCell.self, forCellWithReuseIdentifier: "CatalogCell")
        collectionView.backgroundColor = UIColor.cyan

        self.view.addSubview(collectionView)
    }
}


extension CatalogViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatalogCell", for: indexPath) as! CatalogCell
        cell.backgroundColor = UIColor.green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }
}
