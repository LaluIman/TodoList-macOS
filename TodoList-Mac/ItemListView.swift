//
//  ItemListView.swift
//  TodoList-Mac
//
//  Created by Lalu Iman Abdullah on 30/05/24.
//


import SwiftUI

struct ItemListView: View {
    @ObservedObject var viewModel: ToDoViewModel
    @State private var showAlert = false
    @State private var itemToDelete: ToDoItem?

    var body: some View {
        VStack {
            if viewModel.items.isEmpty {
                VStack {
                    Text("There are no items yet")
                        .font(.title).bold()
                        .foregroundColor(.gray)
                        .padding()
                    Image("noitem")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .padding(50)
                
            } else {
                List {
                    ForEach(viewModel.items) { item in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(item.title)
                                    .font(.title2).bold()
                                Spacer()
                                if item.isCompleted {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.title)
                                        .foregroundColor(.green)
                                } else {
                                    Image(systemName: "circle")
                                        .font(.title)
                                        .foregroundColor(.red)
                                }
                                Button(action: {
                                    itemToDelete = item
                                    showAlert = true
                                }) {
                                    Image(systemName: "trash.fill")
                                        .padding(5)
                                        .foregroundColor(.red)
                                }
                            }
                            .onTapGesture {
                                viewModel.toggleCompletion(for: item)
                            }
                            Text("Due: \(item.date, formatter: dateFormatter)")
                                .font(.headline)
                                .fontWeight(.medium)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(3)
                    }
                    .onDelete(perform: viewModel.deleteItem)
                }
                .listRowSeparator(.hidden)
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Delete Task"),
                message: Text("Are you sure you want to delete this task?"),
                primaryButton: .destructive(Text("Delete")) {
                    if let item = itemToDelete,
                       let index = viewModel.items.firstIndex(where: { $0.id == item.id }) {
                        viewModel.deleteItem(at: IndexSet(integer: index))
                    }
                },
                secondaryButton: .cancel()
            )
        }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }
}

#Preview {
    ItemListView(viewModel: ToDoViewModel())
}
