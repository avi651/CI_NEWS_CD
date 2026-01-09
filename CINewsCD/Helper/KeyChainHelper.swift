//
//  KeyChainHelper.swift
//  CINewsCD
//
//  Created by Avinash on 10/01/26.
//

import Foundation
import Security

final class APIKeyManager {

    static let shared = APIKeyManager()
    private init() {}

    private let keychainKey = "news_api_key"

    // MARK: - Public API

    /// Call this ONCE at app launch
    func setupAPIKey() {
        if let envKey = loadFromEnvironment() {
            saveToKeychain(envKey)
            print("✅ API key loaded from ENV (GitHub Actions)")
        } else if let configKey = loadFromConfigFile() {
            saveToKeychain(configKey)
            print("✅ API key loaded from config.json (local)")
        } else {
            print("❌ API key not found anywhere")
        }
    }

    /// Use this everywhere in app (network layer)
    func getAPIKey() -> String? {
        return readFromKeychain()
    }

    // MARK: - Loaders

    private func loadFromEnvironment() -> String? {
        return ProcessInfo.processInfo.environment["NEWS_API_KEY"]
    }

    private func loadFromConfigFile() -> String? {
        guard
            let url = Bundle.main.url(forResource: "config", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let apiKey = json["api_key"] as? String
        else {
            return nil
        }
        return apiKey
    }

    // MARK: - Keychain

    private func saveToKeychain(_ value: String) {
        let data = value.data(using: .utf8)!

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: keychainKey,
            kSecValueData as String: data
        ]

        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }

    private func readFromKeychain() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: keychainKey,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?
        SecItemCopyMatching(query as CFDictionary, &result)

        guard let data = result as? Data else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
