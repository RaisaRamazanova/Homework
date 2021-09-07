//
//  DetailViewController.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 30.08.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let scrollViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var imageOfClothes: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 400))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private var buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        button.setTitle("Купить", for: .normal)
        button.tintColor = .black
        button.addShadow()
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let titleOfClothes : UILabel = {
        let titleOfClothes = UILabel()
        titleOfClothes.textColor = .black
        titleOfClothes.font = UIFont.boldSystemFont(ofSize: 20)
        return titleOfClothes
    }()
    
    private let descriptionOfClothes : UILabel = {
        let descriptionOfClothes = UILabel()
        descriptionOfClothes.textColor = .black
        descriptionOfClothes.font = UIFont.systemFont(ofSize: 14)
        return descriptionOfClothes
    }()
    
    private let priceOfClothes : UILabel = {
        let priceOfClothes = UILabel()
        priceOfClothes.textColor = .black
        priceOfClothes.font = UIFont.boldSystemFont(ofSize: 20)
        return priceOfClothes
    }()
    
    private let aboutClothesLabel : UILabel = {
        let aboutClothesLabel = UILabel()
        aboutClothesLabel.text = "О товаре"
        aboutClothesLabel.textColor = .black
        aboutClothesLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return aboutClothesLabel
    }()
    
    private let seasonOfClothesLabel : UILabel = {
        let seasonOfClothesLabel = UILabel()
        seasonOfClothesLabel.textColor = .black
        seasonOfClothesLabel.font = UIFont.systemFont(ofSize: 14)
        return seasonOfClothesLabel
    }()
    
    private let genderOfClothesLabel : UILabel = {
        let genderOfClothesLabel = UILabel()
        genderOfClothesLabel.textColor = .black
        genderOfClothesLabel.font = UIFont.systemFont(ofSize: 14)
        return genderOfClothesLabel
    }()

    // MARK: - init
    
    init(forClothes: JsonCellViewModel) {
        super.init(nibName: nil, bundle: nil)
        createCellModel(data: forClothes)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)

        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // this is important for scrolling
        scrollViewContainer.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 50).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        setupLayout()
        
        
    }
    
    // MARK: - Methods

    func createCellModel(data: JsonCellViewModel){
        priceOfClothes.text = data.price
        seasonOfClothesLabel.text = "Сезон: \(data.season)"
        genderOfClothesLabel.text = "Для: \(data.gender)"
        titleOfClothes.text = data.title
        descriptionOfClothes.text = data.description
        titleOfClothes.text = data.title
        imageOfClothes.image = data.image?.image
    }
    
    // создаем constraint и добавляем Subview
    private func setupLayout() {
        [priceOfClothes,
         titleOfClothes,
         descriptionOfClothes,
         genderOfClothesLabel,
         seasonOfClothesLabel,
         imageOfClothes,
         aboutClothesLabel,
         buyButton].forEach {
            scrollViewContainer.addSubview($0)
            $0.toAutoLayout()
        }
        
        NSLayoutConstraint.activate([
            imageOfClothes.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor, constant: 0),
            imageOfClothes.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor),
            imageOfClothes.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor),
            imageOfClothes.heightAnchor.constraint(equalToConstant: 400),
            
            titleOfClothes.topAnchor.constraint(equalTo: imageOfClothes.bottomAnchor, constant: 10),
            titleOfClothes.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            
            descriptionOfClothes.topAnchor.constraint(equalTo: titleOfClothes.bottomAnchor, constant: 10),
            descriptionOfClothes.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            
            priceOfClothes.topAnchor.constraint(equalTo: descriptionOfClothes.bottomAnchor, constant: 10),
            priceOfClothes.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            
            buyButton.topAnchor.constraint(equalTo: priceOfClothes.bottomAnchor, constant: 30),
            buyButton.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
            buyButton.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 50),
            buyButton.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -50),
            
            aboutClothesLabel.topAnchor.constraint(equalTo: buyButton.bottomAnchor, constant: 10),
            aboutClothesLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            
            seasonOfClothesLabel.topAnchor.constraint(equalTo: aboutClothesLabel.bottomAnchor, constant: 10),
            seasonOfClothesLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            
            genderOfClothesLabel.topAnchor.constraint(equalTo: seasonOfClothesLabel.bottomAnchor, constant: 10),
            genderOfClothesLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
        ])
    }
}
