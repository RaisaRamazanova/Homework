//
//  Exercise.swift
//  FactoryMethod
//
//  Created by Рамазанова Раисат on 14.07.2021.
//

import Foundation

protocol Exercise {
    var name: String {get}
    var type: String {get}
    
    func start()
    func stop()
}
