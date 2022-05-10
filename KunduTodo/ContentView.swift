//
//  ContentView.swift
//  KunduTodo
//
//  Created by Blaine on 5/9/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cloudMan = CloudMan.shared
    
    var body: some View {
        NavigationView {
            List {
                ForEach($cloudMan.items) { $item in
                    VStack(alignment: .leading) {
                        Text(item.text)
                            .font(.title)
                        Text(item.date, format: Date.FormatStyle(date: .numeric, time: .standard))
                            .font(.caption)
                    }
                }
                .onDelete(perform: deleteItems)
                
            }
            .navigationTitle("KunduTodo")
            .toolbar {
                ToolbarItem {
                    Button {
                        addItem(title: String.randomWord())
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }

                }
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private func addItem(title: String) {
        withAnimation {
            let item = TodoItem(text: title)
            cloudMan.items.insert(item, at: 0)
            cloudMan.save()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            cloudMan.items.remove(at: offsets)
            cloudMan.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        CloudMan.shared.items = [
            TodoItem(text: "Walk Dog", date: Date()),
            TodoItem(text: "Do a single push-up", date: Date()),
        ]
        
        
        return ContentView()
    }
}

