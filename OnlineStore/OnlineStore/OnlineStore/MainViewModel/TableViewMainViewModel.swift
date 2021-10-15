//
//  TableViewMainViewModel.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 11.09.2021.
//

import UIKit
import CoreData

final class CoreDataViewModel: NSObject {

    // MARK: - properties

    lazy var viewContext = stack.conainer.viewContext
    var reloadTableView: (() -> Void)?
    var coreDataCellViewModels = [CellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    private let stack = NewStack.shared

    // MARK: - functions

    func getCellViewModel(at indexPath: IndexPath) -> CellViewModel {
        return coreDataCellViewModels[indexPath.row]
    }

    func search() {
        viewContext.performAndWait {
            coreDataCellViewModels.removeAll()
            let request = NSFetchRequest<Entity>(entityName: "Entity")
            let result = try? request.execute()
            var data = CellViewModel()
            for res in result! {
                data.title = res.title!
                data.description = res.clothesDescription!
                let image = self.loadImage(url: (URL(string: res.url!) ?? URL(string: "https://www.meme-arsenal.com/memes/15ef8d1ccbb4514e0a758c61e1623b2f.jpg"))!)
                data.image = image
                data.price = res.price!
                data.count = Int(res.count)
                data.gender = res.gender!
                data.urlOfImage = res.url!
                data.season = res.season!
                coreDataCellViewModels.append(data)
            }
        }
    }

    private func loadImage(url: URL) -> UIImage {
        var image = UIImage()
        if let data = try? Data(contentsOf: url) {
            image = UIImage(data: data) ?? UIImage(systemName: "person")!
        }
        return image
    }
}
