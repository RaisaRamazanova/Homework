//
//  SecureStoreQueryable+Extension.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 15.09.2021.
//

import Foundation

// MARK: - Extension SecureStoreQueryable

extension GenericPassword: SecureStoreQueryable {
    var query: [String: Any] {
        var query: [String: Any] = [:]
        query[String(kSecClass)] = kSecClassGenericPassword
        query[String(kSecAttrService)] = key
        query[String(kSecUseAuthenticationUI)] = false
        query[String(kSecAttrAccessible)] = kSecAttrAccessibleAfterFirstUnlock
        return query
    }
}
