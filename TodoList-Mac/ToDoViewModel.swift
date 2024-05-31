//
//  ToDoViewModel.swift
//  TodoList-Mac
//
//  Created by Lalu Iman Abdullah on 30/05/24.
//

import Foundation
import Combine

class ToDoViewModel: ObservableObject {
    @Published var items: [ToDoItem] = [] {
        didSet {
            saveItems()
        }
    }

    init() {
        loadItems()
    }

    func addItem(title: String, date: Date) {
        let newItem = ToDoItem(title: title, isCompleted: false, date: date)
        items.append(newItem)
    }

    func toggleCompletion(for item: ToDoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }

    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    private func saveItems() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "ToDoItems")
        }
    }

    private func loadItems() {
        if let savedItems = UserDefaults.standard.data(forKey: "ToDoItems"),
           let decodedItems = try? JSONDecoder().decode([ToDoItem].self, from: savedItems) {
            items = decodedItems
        }
    }
}
