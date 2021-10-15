//
//  MainViewModel.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 05.09.2021.
//

import UIKit

final class JsonViewModel: NSObject {

    // MARK: - properties

    private var jsonService: JsonServiceProtocol
    var reloadCollectionView: (() -> Void)?
    var jsonCellViewModels = [CellViewModel]() {
        didSet {
            reloadCollectionView?()
        }
    }
    var filterData: [CellViewModel] = []

    // MARK: - init

    init(jsonService: JsonServiceProtocol = JsonService()) {
        self.jsonService = jsonService
    }

    // MARK: - functions

    func getCellViewModel(at indexPath: IndexPath) -> CellViewModel {
        return jsonCellViewModels[indexPath.row]
    }

    func getJsons() {
        jsonService.getJsons { success, model, error in
            if success, let json = model {
                self.fetchJsonData(json: json)
            } else {
                print(error!)
            }
        }
    }

    private func fetchJsonData(json: [JsonData]) {
        var vms = [CellViewModel]()
            for data in json {
                vms.append(createCellModel(datas: data))
            }
        jsonCellViewModels = vms
        filterData = jsonCellViewModels
    }

    private func createCellModel(datas: JsonData) -> CellViewModel {
        let title = datas.title
        let urlOfPlug = "https://www.meme-arsenal.com/memes/15ef8d1ccbb4514e0a758c61e1623b2f.jpg"
        let image = self.loadImage(url: (URL(string: datas.url) ?? URL(string: urlOfPlug))!)
        let price = datas.price
        let description = datas.description
        let gender = datas.gender
        let season = datas.season
        let url = datas.url
        return CellViewModel(title: title, description: description, image: image, price: price, gender: gender, season: season, urlOfImage: url)
    }

    private func loadImage(url: URL) -> UIImage {
        var image = UIImage()
        if let data = try? Data(contentsOf: url) {
            image = UIImage(data: data) ?? UIImage(systemName: "person")!
        }
        return image
    }
}
