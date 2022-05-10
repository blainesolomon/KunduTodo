//
//  Helpers.swift
//  KunduTodo
//
//  Created by Blaine on 5/9/22.
//

import Foundation
import UIKit

extension String {
    static func randomWord() -> String {
        ["Red", "Yellow", "Blue", "Orange", "Green", "Purple", "Pink", "Brown", "Black", "White", "Gray"].randomElement()!
    }
}

extension Array {
    mutating func remove(at set: IndexSet) {
        var arr = Swift.Array(enumerated())
        
        arr.removeAll {
            set.contains($0.offset)
        }
        
        self = arr.map {
            $0.element

        }
    }
}
