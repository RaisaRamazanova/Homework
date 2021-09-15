//
//  DetailViewController.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 30.08.2021.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let stack = NewStack.shared
    lazy var writeContext = stack.conainer.viewContext
    
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
        button.setTitle("Добавить в корзину", for: .normal)
        button.tintColor = .black
        button.addShadow()
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(touchDownButton(sender:)), for: .touchDown)
        button.addTarget(self, action: #selector(touchUpInsideButton), for: .touchUpInside)
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
    
    private let currencyOfClothes : UILabel = {
        let currencyOfClothes = UILabel()
        currencyOfClothes.text = " ₽"
        currencyOfClothes.textColor = .black
        currencyOfClothes.font = UIFont.boldSystemFont(ofSize: 20)
        return currencyOfClothes
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
    
    private let forGenderOfClothesLabel : UILabel = {
        let genderOfClothesLabel = UILabel()
        genderOfClothesLabel.text = "Для: "
        genderOfClothesLabel.textColor = .black
        genderOfClothesLabel.font = UIFont.systemFont(ofSize: 14)
        return genderOfClothesLabel
    }()
    
    private let forSeasonOfClothesLabel : UILabel = {
        let genderOfClothesLabel = UILabel()
        genderOfClothesLabel.text = "Сезон: "
        genderOfClothesLabel.textColor = .black
        genderOfClothesLabel.font = UIFont.systemFont(ofSize: 14)
        return genderOfClothesLabel
    }()
    
    private var urlOfImage = "https://www.meme-arsenal.com/memes/15ef8d1ccbb4514e0a758c61e1623b2f.jpg"
    
    
    // MARK: - init
    
    init(forClothes: CellViewModel) {
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
        scrollViewContainer.heightAnchor.constraint(equalToConstant: 700).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        setupLayout()
    }
    
    // MARK: - Methods
    
    @objc fileprivate func touchUpInsideButton(sender: UIButton) {
        view.animateUpView(sender)
    }

    @objc fileprivate func touchDownButton(sender: UIButton) {
        sender.animateDownView(sender)
        writeContext.performAndWait {
            let request = NSFetchRequest<Entity>(entityName: "Entity")
            do {
                let result = try request.execute()
                var emptyData = true
                var isNotInData = true
                for item in result {
                    emptyData = false
                    if (item.clothesDescription! + item.title!) == (descriptionOfClothes.text! + titleOfClothes.text!) {
                        let clothesCount = Int(item.count)
                        clear(title: item.title!, description: item.clothesDescription!)
                        saveData(count: clothesCount + 1)
                        isNotInData = false
                    }
                }
                if emptyData || isNotInData {
                    saveData(count: 1)
                }
            } catch {
                print("error")
            }
        }
    }
    
    func clear(title: String, description: String) {
        let context = stack.conainer.viewContext
        context.performAndWait {
            let request = NSFetchRequest<Entity>(entityName: "Entity")
            request.returnsObjectsAsFaults = false
            do {
                let result = try request.execute()
                for item in result {
                    if item.title == title && item.clothesDescription == description {
                        context.delete(item)
                        try? context.save()
                    }
                }
            } catch {
                print(error)
            }
        }
        self.viewWillAppear(true)
    }
    
    func saveData(count: Int) {
        let writeContext = stack.conainer.viewContext
        writeContext.performAndWait{
            let clothes = Entity(context: writeContext)
            clothes.title = titleOfClothes.text
            clothes.clothesDescription = descriptionOfClothes.text
            clothes.price = priceOfClothes.text!
            clothes.season = seasonOfClothesLabel.text
            clothes.gender = genderOfClothesLabel.text
            clothes.url = urlOfImage
            clothes.count = Int16(count)
            try? writeContext.save()
        }
    }
    
    func createCellModel(data: CellViewModel){
        titleOfClothes.text = data.title
        descriptionOfClothes.text = data.description
        priceOfClothes.text = data.price
        seasonOfClothesLabel.text = data.season
        genderOfClothesLabel.text = data.gender
        imageOfClothes.image = data.image?.image
        urlOfImage = data.urlOfImage
    }
    
    // создаем constraint и добавляем Subview
    private func setupLayout() {
        [priceOfClothes,
         currencyOfClothes,
         titleOfClothes,
         descriptionOfClothes,
         genderOfClothesLabel,
         seasonOfClothesLabel,
         imageOfClothes,
         aboutClothesLabel,
         buyButton,
         forGenderOfClothesLabel,
         forSeasonOfClothesLabel].forEach {
            scrollViewContainer.addSubview($0)
            $0.toAutoLayout()
        }
        
        NSLayoutConstraint.activate([
            imageOfClothes.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor, constant: 0),
            imageOfClothes.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 25),
            imageOfClothes.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -25),
            imageOfClothes.heightAnchor.constraint(equalToConstant: 400),
            
            titleOfClothes.topAnchor.constraint(equalTo: imageOfClothes.bottomAnchor, constant: 10),
            titleOfClothes.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            
            descriptionOfClothes.topAnchor.constraint(equalTo: titleOfClothes.bottomAnchor, constant: 10),
            descriptionOfClothes.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            
            priceOfClothes.topAnchor.constraint(equalTo: descriptionOfClothes.bottomAnchor, constant: 10),
            priceOfClothes.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            
            currencyOfClothes.topAnchor.constraint(equalTo: descriptionOfClothes.bottomAnchor, constant: 10),
            currencyOfClothes.leftAnchor.constraint(equalTo: priceOfClothes.rightAnchor, constant: 5),
            
            buyButton.topAnchor.constraint(equalTo: priceOfClothes.bottomAnchor, constant: 30),
            buyButton.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
            buyButton.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 50),
            buyButton.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -50),
            buyButton.heightAnchor.constraint(equalToConstant: 50),
            
            aboutClothesLabel.topAnchor.constraint(equalTo: buyButton.bottomAnchor, constant: 30),
            aboutClothesLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            
            seasonOfClothesLabel.topAnchor.constraint(equalTo: aboutClothesLabel.bottomAnchor, constant: 10),
            seasonOfClothesLabel.leftAnchor.constraint(equalTo: forSeasonOfClothesLabel.rightAnchor, constant: 5),
            
            forSeasonOfClothesLabel.topAnchor.constraint(equalTo: aboutClothesLabel.bottomAnchor, constant: 10),
            forSeasonOfClothesLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            
            genderOfClothesLabel.topAnchor.constraint(equalTo: seasonOfClothesLabel.bottomAnchor, constant: 10),
            genderOfClothesLabel.leftAnchor.constraint(equalTo: forGenderOfClothesLabel.rightAnchor, constant: 5),
            
            forGenderOfClothesLabel.topAnchor.constraint(equalTo: seasonOfClothesLabel.bottomAnchor, constant: 10),
            forGenderOfClothesLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
        ])
    }
}