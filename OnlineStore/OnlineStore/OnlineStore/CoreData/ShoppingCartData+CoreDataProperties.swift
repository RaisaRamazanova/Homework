//
//  ShoppingCartData+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 09.09.2021.
//
//

import Foundation
import CoreData


extension ShoppingCartData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShoppingCartData> {
        return NSFetchRequest<ShoppingCartData>(entityName: "ShoppingCartData")
    }

    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var price: String?
    @NSManaged public var descriptionOfClothes: String?
    @NSManaged public var gender: String?
    @NSManaged public var season: String?

}

extension ShoppingCartData : Identifiable {

}
