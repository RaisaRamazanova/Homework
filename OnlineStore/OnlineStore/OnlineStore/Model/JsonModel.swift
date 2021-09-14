//
//  CustomCellFirstController.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 09.08.2021.
//

import UIKit

typealias JsonDatas =  JsonData.Type

// MARK: - Json structs

struct JsonData: Codable {
    var title: String
    var id: Int
    var url: String
    var price: String
    var description: String
    var gender: String
    var season: String
}
