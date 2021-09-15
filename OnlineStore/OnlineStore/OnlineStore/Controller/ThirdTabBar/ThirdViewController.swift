//
//  ThirdViewController.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 30.08.2021.
//

import UIKit
import CoreData

class ThirdViewController: UIViewController {
    
    lazy var viewModel = {CoreDataViewModel()}()
    lazy var tableView = UITableView(frame: .zero)

    private let emptyCart : UILabel = {
        let cl = UILabel()
        cl.textColor = .gray
        cl.text = "Добавьте в корзину товары из каталога"
        cl.textColor = .black
        cl.font = UIFont.systemFont(ofSize: 15)
        cl.textAlignment = .center
        return cl
    }()
    
    private var imageOfCart: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Корзина")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let stack = NewStack.shared
    lazy var writeContext = stack.conainer.viewContext

    // MARK: - override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigation()
        initTableView()
        setupLayout()
        self.navigationController?.navigationBar.tintColor = .white
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initViewModel()
        if viewModel.coreDataCellViewModels.count == 0 {
            tableView.isHidden = true
            emptyCart.isHidden = false
            imageOfCart.isHidden = false
        }else {
            tableView.isHidden = false
            emptyCart.isHidden = true
            imageOfCart.isHidden = true}
    }
    
    // MARK: - functions
    
    func write(data: CellViewModel) {
        writeContext.performAndWait {
            let request = NSFetchRequest<Entity>(entityName: "Entity")
            do {
                let result = try request.execute()
                for item in result {
                    if (item.clothesDescription! + item.title!) == (data.description + data.title) {
                        let clothesCount = Int(item.count)
                        clearClothes(title: item.title!, description: item.clothesDescription!)
                        if clothesCount > 1 {
                            saveData(count: clothesCount - 1, for: data)
                        }
                        self.viewWillAppear(true)
                    }
                }
            } catch {
                print("error")
            }
        }
    }
    
    func clearClothes(title: String, description: String) {
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
    }
    
    func saveData(count: Int, for data: CellViewModel) {
        let writeContext = stack.conainer.viewContext
        writeContext.performAndWait{
            let clothes = Entity(context: writeContext)
            clothes.title = data.title
            clothes.clothesDescription = data.description
            clothes.price = data.price
            clothes.season = data.season
            clothes.gender = data.gender
            clothes.url = data.urlOfImage
            clothes.count = Int16(count)
            try? writeContext.save()
        }
    }
    
    // инициализируем  tableView
    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: String(describing: CustomTableViewCell.self))
    }

    // задаем имя navigationBar и другие параметры
    private func initNavigation() {
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Корзина"
        navigationController?.navigationBar.barTintColor = UIColor(#colorLiteral(red: 0.5601426959, green: 0.8468149304, blue: 0.9041565061, alpha: 1))
    }
    
    func initViewModel() {
        viewModel.search()
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async { [self] in
                self?.tableView.reloadData()
                ActivityIndicatorViewController.stopAnimating(in: self ?? ThirdViewController())
            }
        }
    }
    
    // создаем constraint и добавляем Subview
    private func setupLayout() {
        [imageOfCart,
         emptyCart,
         tableView].forEach {
            view.addSubview($0)
            $0.toAutoLayout()
        }
        NSLayoutConstraint.activate([
            imageOfCart.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            imageOfCart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageOfCart.heightAnchor.constraint(equalToConstant: 200),
            imageOfCart.widthAnchor.constraint(equalToConstant: 200),
            
            emptyCart.topAnchor.constraint(equalTo: imageOfCart.bottomAnchor , constant: 10),
            emptyCart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            emptyCart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
