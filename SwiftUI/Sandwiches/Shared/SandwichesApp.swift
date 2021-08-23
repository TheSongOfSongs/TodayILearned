//
//  SandwichesApp.swift
//  Shared
//
//  Created by Jinhyang on 2021/08/21.
//

import SwiftUI

@main
struct SandwichesApp: App {
    @StateObject private var store = SandwichStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
