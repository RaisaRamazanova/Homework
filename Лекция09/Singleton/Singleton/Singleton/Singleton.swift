//
//  Singleton.swift
//  Singleton
//
//  Created by Рамазанова Раисат on 14.07.2021.
//

import UIKit

class Animal {
    
    static let cat = Animal()
    
    var name: String = "Tom"
    var food: String = "meat"
    
    private init() {}
}
