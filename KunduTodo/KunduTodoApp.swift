//
//  KunduTodoApp.swift
//  KunduTodo
//
//  Created by Blaine on 5/9/22.
//

import SwiftUI

@main
struct KunduTodoApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase) {
                    if $0 == .active {
                        NSUbiquitousKeyValueStore.default.synchronize()
                    }
                }
        }
    }
}
