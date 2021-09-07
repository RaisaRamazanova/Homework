//
//  MainViewModel.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 05.09.2021.
//

import UIKit

struct JsonCellViewModel {
    var title: String = ""
    var id: Int = 0
    var image: UIImageView?
    var price: String = ""
    var description: String = ""
    var gender: String = ""
    var season: String = ""
}


class JsonViewModel: NSObject {
    // MARK: - properties
    
    
    var indexDetailVCTitle: Int = 0
    private var jsonService: JsonServiceProtocol
    var reloadCollectionView: (() -> Void)?
    var jsonCellViewModels = [JsonCellViewModel]() {
        didSet {
            reloadCollectionView?()
        }
    }

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
    }
    
    func createCellModel(datas: JsonData) -> JsonCellViewModel {
        let title = datas.title
        let id = datas.id

        let image = UIImageView()
        image.image = self.loadImage(url: datas.url)
        
        let price = datas.price
        let description = datas.description
        let gender = datas.gender
        let season = datas.season

        return JsonCellViewModel(title: title, id: id, image: image, price: price, description: description, gender: gender, season: season)
    }
    
    func loadImage(url: URL) -> UIImage {
        var image = UIImage()
        if let data = try? Data(contentsOf: url) {
            image = UIImage(data: data) ?? UIImage(named: "1")!
        }
        return image
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> JsonCellViewModel {
        return jsonCellViewModels[indexPath.row]
    }
}
