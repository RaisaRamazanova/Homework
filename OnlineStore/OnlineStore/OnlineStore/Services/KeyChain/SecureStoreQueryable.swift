//
//  SecureStoreQueryable.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 06.09.2021.
//

import Foundation

protocol SecureStoreQueryable {
    var key: String { get }
    var query: [String: Any] { get }
}
