//
//  CatalogViewController.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit


class FirstViewController : UIViewController, UISearchBarDelegate {
    
    // MARK: - Properties
    let screenSize = UIScreen.main.bounds
    lazy var viewModel = {JsonViewModel()}()
    let layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    lazy var searchBar = UISearchBar()

    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        hideKeyboardWhenTappedAround()
        
        // добавим заголовок в navigationBar и добавим под ним searchBar
        initNavigation()
        initSearchBar()
        initTableView()
        setupLayout()
        ActivityIndicatorViewController.startAnimating(in: self)
        initViewModel()  
    }
    
    // MARK: - Methods
    
    func initViewModel() {
        viewModel.getJsons()
        viewModel.reloadCollectionView = { [weak self] in
            DispatchQueue.main.async { [self] in
                self?.collectionView.reloadData()
                ActivityIndicatorViewController.stopAnimating(in: self ?? FirstViewController())
            }
        }
    }
    
    // инициализируем  collectionView
    private func initTableView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(#colorLiteral(red: 0.8956577182, green: 0.8958080411, blue: 0.8956379294, alpha: 1))
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CustomCollectionViewCell.self))
    }
    
    // задаем имя navigationBar и другие параметры
    private func initNavigation() {
        title = "Каталог"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(#colorLiteral(red: 0.5601426959, green: 0.8468149304, blue: 0.9041565061, alpha: 1))
    }
    
    // инициализируем  searchBar
    private func initSearchBar() {
        searchBar.placeholder = "Поиск"
        searchBar.barStyle = .default
        searchBar.isTranslucent = false
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.white
    }
    
    // задаем сonstraint для searchBar и tableView
    private func setupLayout() {
        print(searchBar.frame.height)
        [collectionView,
         searchBar].forEach {
            view.addSubview($0)
            $0.toAutoLayout()
        }
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.bottomAnchor.constraint(equalTo: collectionView.topAnchor),
            
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.jsonCellViewModels.removeAll()
        for item in viewModel.filterData {
            if (item.title.lowercased().contains(searchBar.text!.lowercased())) {
                self.viewModel.jsonCellViewModels.append(item)
            }
            if (item.description.lowercased().contains(searchBar.text!.lowercased())) {
                self.viewModel.jsonCellViewModels.append(item)
            }
        }
        if searchText == "" {
            viewModel.jsonCellViewModels = viewModel.filterData
        }
        collectionView.reloadData()
    }
}

