//
//  TodoList_MacApp.swift
//  TodoList-Mac
//
//  Created by Lalu Iman Abdullah on 30/05/24.
//

import SwiftUI

@main
struct TodoList_MacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 100, maxWidth: 1000, minHeight: 100, maxHeight: 800)
        }
        .defaultSize(width: 700, height: 400)
        .windowResizability(.contentSize)
    }
}
