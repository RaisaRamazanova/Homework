//
//  NewStack.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 09.09.2021.
//

import Foundation
import CoreData

final class NewStack {

    static let shared = NewStack()

    let conainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores { desc, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
        return container
    }()

    private init() {}
}

