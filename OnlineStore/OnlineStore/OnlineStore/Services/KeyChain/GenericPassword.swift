//
//  GenericPassword.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 06.09.2021.
//

import Foundation

struct GenericPassword {
    let key: String
}

extension GenericPassword: SecureStoreQueryable {

    var query: [String : Any] {
        var query: [String: Any] = [:]
        query[String(kSecClass)] = kSecClassGenericPassword
        query[String(kSecAttrService)] = key
        query[String(kSecUseAuthenticationUI)] = false
        query[String(kSecAttrAccessible)] = kSecAttrAccessibleAfterFirstUnlock
        return query
    }
}

