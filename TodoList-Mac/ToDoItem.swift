//
//  ToDoItem.swift
//  TodoList-Mac
//
//  Created by Lalu Iman Abdullah on 30/05/24.
//

import Foundation

struct ToDoItem: Identifiable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var date: Date

    init(id: UUID = UUID(), title: String, isCompleted: Bool, date: Date) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.date = date
    }
}
