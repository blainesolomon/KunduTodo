//
//  CloudMan.swift
//  KunduTodo
//
//  Created by Blaine on 5/9/22.
//

import Foundation

class CloudMan: ObservableObject {
    @Published var items = [TodoItem]()
    private let TodoKey = "TodoKey"
    static let shared = CloudMan()
    
    private init() {
        loadItems()
        
        NotificationCenter.default.addObserver(forName: NSUbiquitousKeyValueStore.didChangeExternallyNotification, object: NSUbiquitousKeyValueStore.default, queue: .main, using: { [weak self] _ in
            self?.loadItems()
        })
    }
    
    @objc func loadItems() {
        guard let data = NSUbiquitousKeyValueStore.default.data(forKey: TodoKey) else {
            return
        }
        
        guard let loadedItems = try? JSONDecoder().decode([TodoItem].self, from: data) else {
            return
        }
        
        items = loadedItems.sorted(by: {
            $0.date > $1.date
        })
    }
    
    func save() {
        guard let data = try? JSONEncoder().encode(items) else {
            return
        }
                
        NSUbiquitousKeyValueStore.default.set(data, forKey: TodoKey)
        NSUbiquitousKeyValueStore.default.synchronize()
    }
}
