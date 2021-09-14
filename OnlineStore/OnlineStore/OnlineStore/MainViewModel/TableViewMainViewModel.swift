//
//  TableViewMainViewModel.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 11.09.2021.
//

import UIKit
import CoreData

class CoreDataViewModel: NSObject {
    
    // MARK: - properties
    
    private let stack = NewStack.shared
    lazy var viewContext = stack.conainer.viewContext
    var reloadTableView: (() -> Void)?
    var coreDataCellViewModels = [CoreDataCellViewModel]()
    {
        didSet {
            reloadTableView?()
        }
    }

    // MARK: - functions

    func search() {
        viewContext.performAndWait {
            coreDataCellViewModels.removeAll()
            let request = NSFetchRequest<Entity>(entityName: "Entity")
            let result = try? request.execute()
            var data = CoreDataCellViewModel()
            for res in result! {
                data.titleAndDescription = res.clothesDescription! + " "  + res.title!
                let image = UIImageView()
                image.image = self.loadImage(url: (URL(string: res.url!) ?? URL(string: "https://www.meme-arsenal.com/memes/15ef8d1ccbb4514e0a758c61e1623b2f.jpg"))!)
                data.image = image
                data.price = res.price!
                data.count = Int(res.count)
                coreDataCellViewModels.append(data)
            }
        }
    }
    
    func loadImage(url: URL) -> UIImage {
        var image = UIImage()
        if let data = try? Data(contentsOf: url) {
            image = UIImage(data: data) ?? UIImage(systemName: "person")!
        }
        return image
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> CoreDataCellViewModel {
        return coreDataCellViewModels[indexPath.row]
    }
}

