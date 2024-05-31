//
//  ContentView.swift
//  TodoList-Mac
//
//  Created by Lalu Iman Abdullah on 30/05/24.
//


import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ToDoViewModel()
    @State private var showAddItemView = false
    var body: some View {
        ZStack {
            VStack {
                ItemListView(viewModel: viewModel)
                Spacer()
            }

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        showAddItemView = true
                    }) {
                        Image(systemName: "plus")
                            .clipShape(Circle())
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 45, height: 55)
                    }
                    .padding()
                    .sheet(isPresented: $showAddItemView) {
                        AddItemView(viewModel: viewModel)
                            .frame(width: 310, height: 250)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}




