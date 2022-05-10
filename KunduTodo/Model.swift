//
//  Model.swift
//  KunduTodo
//
//  Created by Blaine on 5/9/22.
//

import Foundation

struct TodoItem: Codable, Identifiable {
    var text: String
    var date = Date()
    var id = UUID()
}
