//
//  CINewsCDApp.swift
//  CINewsCD
//
//  Created by Avinash on 08/01/26.
//

import SwiftUI

@main
struct CINewsCDApp: App {
    init() {
        // 🔐 API key ko Keychain me save karo (1st launch)
        guard let apiKey = KeychainHelper.shared.read(for: "news_api_key") else {
            fatalError("API key missing")
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
