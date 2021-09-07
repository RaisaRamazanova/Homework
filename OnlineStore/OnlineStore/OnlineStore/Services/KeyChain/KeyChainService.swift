//
//  KeyChainService.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 06.09.2021.
//

import Foundation
import Security

public final class KeychainService {

    func save<T: Encodable>(value: T, queryItem: SecureStoreQueryable) -> Bool {
        // Конвертация данных в Data
        // можно не просто string.data(.utf8) вместо Generic
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(value) else {
            return false
        }

        // Добавляем в query наш пароль - data
        var query =     queryItem.query
        query[String(kSecValueData)] = data

        // Проверяем есть ли уже в KeyChain что-то по такому ключу?
        var status = SecItemCopyMatching(query as CFDictionary, nil)
        // идет обработка статуса
        switch status {
        case errSecSuccess:
          var attributesToUpdate: [String: Any] = [:]
          attributesToUpdate[String(kSecValueData)] = data

            // Если есть, то обновляем текущий объект новымыми даныными
          status = SecItemUpdate(query as CFDictionary,
                                 attributesToUpdate as CFDictionary)
          if status != errSecSuccess {
            return false
          }
        case errSecItemNotFound:
            // если нет, то создаем новый объект в хранилище
          query[String(kSecValueData)] = data
          status = SecItemAdd(query as CFDictionary, nil)
          if status != errSecSuccess {
            return false
          }
        default:
            print(status)
          return false
        }
        return true
    }

    func object<T: Decodable>(for queryItem: SecureStoreQueryable) -> T? {
        var query = queryItem.query
        // Аттрибуты для чтения
        query[String(kSecMatchLimit)] = kSecMatchLimitOne
        query[String(kSecReturnAttributes)] = kCFBooleanTrue
        query[String(kSecReturnData)] = kCFBooleanTrue

        var anyObject: AnyObject?
        // Пытаемся достать данные через withUnsafeMutablePointer
        let status = withUnsafeMutablePointer(to: &anyObject) {
            // $0 - anyObject обертнуты в UnsafeMutablePointer
            SecItemCopyMatching(query as CFDictionary, $0)
        }
        // Обработка статуса
        if status == errSecSuccess {
            // Кастинг к Dict и дальше обработка Data
            guard let queryResult = anyObject as? [String: Any] else { return nil }
            if let data = queryResult[(String(kSecValueData))] as? Data {
                let decoder = JSONDecoder()
                let result = try? decoder.decode(T.self, from: data)
                return result
            }
        }
        return nil
    }
}

