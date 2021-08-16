//
//  CatalogViewController.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit

class FirstViewController : UIViewController {
    // MARK: - Properties
    let screenSize = UIScreen.main.bounds
    fileprivate let data = [
        CustomData(title: "The Islands!", url: "maxcodes.io/enroll", backgroundImage: #imageLiteral(resourceName: "whatsapp_image_2021-06-01_at_165424ormr")),
        CustomData(title: "Subscribe to maxcodes boiiii!", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "7fc9d8da4861e4031edd1f73630211b1")),
        CustomData(title: "StoreKit Course!", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "5ee7fea6739e5f1da1e487b6dd96f4d4")),
        CustomData(title: "Collection Views!", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "ode_0221")),
        CustomData(title: "MapKit!", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "odezhda-dlya-polnyh-devushek-2021-kak-vybrat_105426zUJ")),
    ]
    fileprivate let clothesData = [
        CustomDataClothes(title: "Clothes", url: "maxcodes.io/enroll", backgroundImage: #imageLiteral(resourceName: "940_2.jpg"), price: 1199),
        CustomDataClothes(title: "Clothes", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "20140380001_620_Back.jpg"), price: 1599),
        CustomDataClothes(title: "Clothes", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "22498.970"), price: 899),
        CustomDataClothes(title: "Clothes", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "1"), price: 999),
        CustomDataClothes(title: "Clothes", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "16998360299"), price: 799),
        CustomDataClothes(title: "Clothes", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "0ca09a908e0557f8e6a66ca01c639fc3_1221_1607"), price: 1399),
        CustomDataClothes(title: "Clothes", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "4bc3a8ffce105f3c5345a42d5cbbea97_1"), price: 1299)
    ]
    
    fileprivate let topCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomTopCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    fileprivate let lowerCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 330, right: 0)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5

        let cv1 = UICollectionView(frame: CGRect(x: 0, y: 300, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
        cv1.translatesAutoresizingMaskIntoConstraints = false
        cv1.register(CustomLowerCell.self, forCellWithReuseIdentifier: "MyCell")
        return cv1
    }()
    
    // MARK: - Overriden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
        view.addSubview(topCollectionView)
        topCollectionView.backgroundColor = .systemGray
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        topCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        topCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        topCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true

        view.addSubview(lowerCollectionView)
        lowerCollectionView.backgroundColor = UIColor.systemGray
        lowerCollectionView.dataSource = self
        lowerCollectionView.delegate = self
    }
}

// MARK: - Extension
extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.topCollectionView {
            return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
        }
        return CGSize(width: screenSize.width / 2 - 5, height: screenSize.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.topCollectionView {
            return data.count
        }
        return clothesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.topCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomTopCell
            cell.data = self.data[indexPath.item]
            return cell
        }
        if collectionView == self.lowerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CustomLowerCell
            cell.data = self.clothesData[indexPath.item]
            cell.backgroundColor = UIColor.systemGray
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CustomLowerCell
        cell.backgroundColor = UIColor.systemGray
        return cell
    }
}
