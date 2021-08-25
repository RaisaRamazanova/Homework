//
//  CatalogViewController.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit

class FirstViewController : UIViewController, UISearchBarDelegate {
    
    
    var a = 1
    // MARK: - Properties
    let screenSize = UIScreen.main.bounds
    var filteredData: [String]!
    let clothersData = Data.clothersData
    var searchBarHeight = 30
    var searchBarY = 100
    lazy var searchBar : UISearchBar = {
        let s = UISearchBar(frame: CGRect(x: 0, y: searchBarY, width: Int(screenSize.width), height: searchBarHeight))
            s.placeholder = "Поиск..."
            s.delegate = self
            s.tintColor = .black
//            s.barTintColor = .gray
            s.barStyle = .default
            s.sizeToFit()
        return s
    }()
    var displayData: [String] = [String]()
    
    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayData = clothersData.data3
        view.backgroundColor = .systemGray

//        topCollectionViewSettings()
        lowerCollectionViewSettings()
        customSearchBar()
        view.addSubview(searchBar)
    }
    
    // MARK: - Methods
    
    func customSearchBar() {


    }
    
//    fileprivate func topCollectionViewSettings() {
//        view.addSubview(topCollectionView)
//        topCollectionView.backgroundColor = .systemGray
//        topCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
//        topCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//        topCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        topCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
//        topCollectionView.delegate = self
//        topCollectionView.dataSource = self
//    }
    
    fileprivate func lowerCollectionViewSettings() {
        view.addSubview(lowerCollectionView)
        lowerCollectionView.backgroundColor = UIColor.systemGray
        
        lowerCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(searchBarHeight + searchBarY + 30)).isActive = true
        lowerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        lowerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        lowerCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height - 170).isActive = true
        
        lowerCollectionView.dataSource = self
        lowerCollectionView.delegate = self
    }
    
//    fileprivate let topCollectionView:UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        cv.register(CustomTopCell.self, forCellWithReuseIdentifier: "cell")
//        return cv
//    }()
    
    fileprivate let lowerCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 330, right: 0)
//        layout.minimumLineSpacing = 5
//        layout.minimumInteritemSpacing = 5
        let cv1 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv1.translatesAutoresizingMaskIntoConstraints = false
        cv1.register(CustomLowerCell.self, forCellWithReuseIdentifier: "MyCell")
        return cv1
    }()
}

// MARK: - Extension
extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == self.topCollectionView {
//            return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/3)
//        }
        return CGSize(width: screenSize.width / 2 - 5, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == self.topCollectionView {
//            return clothersData.data1.count
//        }
        return clothersData.data1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == self.topCollectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomTopCell
//            cell.data = self.clothersData.data1[indexPath.item]
//            return cell
//        }
        if collectionView == self.lowerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CustomLowerCell
            cell.data = self.clothersData.data2[indexPath.item]
            cell.backgroundColor = UIColor.systemGray
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CustomLowerCell
        cell.backgroundColor = UIColor.systemGray
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        displayData = clothersData.data3.filter { $0.range(of: searchText, options: .caseInsensitive) != nil }
//        collectionView.reloadData()
    }
}

