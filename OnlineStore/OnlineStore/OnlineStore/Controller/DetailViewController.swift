//
//  DetailViewController.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 30.08.2021.
//

import UIKit
import CoreData

final class DetailViewController: UIViewController {

    // MARK: - private properties

    private let stack = NewStack.shared
    private lazy var writeContext = stack.conainer.viewContext
    private let mainView = DetailView()
    private var urlOfImage = "https://www.meme-arsenal.com/memes/15ef8d1ccbb4514e0a758c61e1623b2f.jpg"

    // MARK: - init

    init(forClothes: CellViewModel) {
        super.init(nibName: nil, bundle: nil)
        createCellModel(data: forClothes)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setActions()
    }

    // MARK: - Methods

    private func setActions() {
        mainView.actionOnButtonTap1 = {
            self.touchUpInsideButton()
        }
        mainView.actionOnButtonTap2 = {
            self.touchDownButton()
        }
    }

    fileprivate func touchUpInsideButton() {
        view.animateUpView(self.mainView.buyButton)
    }

    fileprivate func touchDownButton() {
        view.animateDownView(self.mainView.buyButton)
        writeContext.performAndWait {
            let request = NSFetchRequest<Entity>(entityName: "Entity")
            do {
                let result = try request.execute()
                var emptyData = true
                var isNotInData = true
                for item in result {
                    emptyData = false
                    if (item.clothesDescription! + item.title!) == (mainView.descriptionOfClothes.text! + mainView.titleOfClothes.text!) {
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

    private func clear(title: String, description: String) {
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

    private func saveData(count: Int) {
        let writeContext = stack.conainer.viewContext
        writeContext.performAndWait {
            let clothes = Entity(context: writeContext)
            clothes.title = mainView.titleOfClothes.text
            clothes.clothesDescription = mainView.descriptionOfClothes.text
            clothes.price = mainView.priceOfClothes.text!
            clothes.season = mainView.seasonOfClothesLabel.text
            clothes.gender = mainView.genderOfClothesLabel.text
            clothes.url = urlOfImage
            clothes.count = Int16(count)
            try? writeContext.save()
        }
    }

    private func createCellModel(data: CellViewModel) {
        mainView.titleOfClothes.text = data.title
        mainView.descriptionOfClothes.text = data.description
        mainView.priceOfClothes.text = data.price
        mainView.seasonOfClothesLabel.text = data.season
        mainView.genderOfClothesLabel.text = data.gender
        mainView.imageOfClothes.image = data.image
        urlOfImage = data.urlOfImage
    }
}
