//
//  MainViewModel.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 05.09.2021.
//

import UIKit

class JsonViewModel: NSObject {
    // MARK: - properties

    private var jsonService: JsonServiceProtocol
    var reloadCollectionView: (() -> Void)?
    var jsonCellViewModels = [JsonCellViewModel]() {
        didSet {
            reloadCollectionView?()
        }
    }
    var filterData: [JsonCellViewModel] = []

    // MARK: - init
    
    init(jsonService: JsonServiceProtocol = JsonService()) {
        self.jsonService = jsonService
    }
    
    // MARK: - functions
    
    func getJsons() {
        jsonService.getJsons { success, model, error in
            if success, let json = model {
                self.fetchJsonData(json: json)
            } else {
                print(error!)
            }
        }
    }
    
    func fetchJsonData(json: [JsonData]) {
        var vms = [JsonCellViewModel]()
            for data in json {
                vms.append(createCellModel(datas: data))
            }
        jsonCellViewModels = vms
        filterData = jsonCellViewModels
    }
    
    func createCellModel(datas: JsonData) -> JsonCellViewModel {
        let title = datas.title
        let image = UIImageView()
        image.image = self.loadImage(url: (URL(string: datas.url) ?? URL(string: "https://www.meme-arsenal.com/memes/15ef8d1ccbb4514e0a758c61e1623b2f.jpg"))!)
        let price = datas.price
        let description = datas.description
        let gender = datas.gender
        let season = datas.season
        let url = datas.url
        return JsonCellViewModel(title: title, image: image, price: price, description: description, gender: gender, season: season, urlOfImage: url)
    }
    
    func loadImage(url: URL) -> UIImage {
        var image = UIImage()
        if let data = try? Data(contentsOf: url) {
            image = UIImage(data: data) ?? UIImage(systemName: "person")!
        }
        return image
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> JsonCellViewModel {
        return jsonCellViewModels[indexPath.row]
    }
}
