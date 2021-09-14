//
//  Entity+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 09.09.2021.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

   
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var price: String?
    @NSManaged public var clothesDescription: String?
    @NSManaged public var gender: String?
    @NSManaged public var season: String?
    @NSManaged public var count: Int16

}

extension Entity : Identifiable {

}
