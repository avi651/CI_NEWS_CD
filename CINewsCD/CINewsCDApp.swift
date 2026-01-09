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
        APIKeyManager.shared.setupAPIKey()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
