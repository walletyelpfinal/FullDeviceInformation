//
//  SaveKeychain.swift
//
//
//  Created by pastry on 27/08/25.
//

import UIKit
import Security

private let service = "com.fullDeviceInfo.keychain"

class SaveKeychain: NSObject {
    
    @MainActor static let shared = SaveKeychain()
    
    
    @discardableResult
    func save(string: String, forKey key: String) -> Bool {
        guard let data = string.data(using: .utf8) else { return false }
        return save(data: data, forKey: key)
    }
    
    func loadString(forKey key: String) -> String {
        guard let data = loadData(forKey: key) else { return "" }
        return String(data: data, encoding: .utf8) ?? ""
    }
    
    
    
    
    
    
    
    
    
    
    @discardableResult
    private func save(data: Data, forKey key: String) -> Bool {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlockedThisDeviceOnly
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        return status == errSecSuccess
    }
    
    private func loadData(forKey key: String) -> Data? {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        return (result as? Data)
    }
    
    @discardableResult
    func update(data: Data, forKey key: String) -> Bool {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key
        ]
        
        let attributes: [String: Any] = [
            kSecValueData as String: data
        ]
        
        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        
        return status == errSecSuccess
    }
    
    @discardableResult
    func update(string: String, forKey key: String) -> Bool {
        guard let data = string.data(using: .utf8) else { return false }
        return update(data: data, forKey: key)
    }
    
    @discardableResult
    func delete(forKey key: String) -> Bool {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        return status == errSecSuccess
    }
    
    func exists(forKey key: String) -> Bool {
        return loadData(forKey: key) != nil
    }
    
    @discardableResult
    func clearAll() -> Bool {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        return status == errSecSuccess
    }
    
    func getAllKeys() -> [String] {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecReturnAttributes as String: true,
            kSecMatchLimit as String: kSecMatchLimitAll
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess,
              let items = result as? [[String: Any]] else {
            return []
        }
        
        return items.compactMap { $0[kSecAttrAccount as String] as? String }
    }
}
