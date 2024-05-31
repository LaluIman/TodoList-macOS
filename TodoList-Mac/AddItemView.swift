//
//  AddItemView.swift
//  TodoList-Mac
//
//  Created by Lalu Iman Abdullah on 30/05/24.
//


import SwiftUI

struct AddItemView: View {
    @ObservedObject var viewModel: ToDoViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var newTaskTitle = ""
    @State private var taskDate = Date()
    var body: some View {
        VStack {
            Text("Add an item!")
                .font(.system(size: 20, weight: .bold))
            
            VStack {
                TextField("New Task", text: $newTaskTitle)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker("Select Date", selection: $taskDate, displayedComponents: .date)
                       .datePickerStyle(CompactDatePickerStyle())
            }
            
           
            
            Button(action: {
                guard !newTaskTitle.isEmpty else { return }
                viewModel.addItem(title: newTaskTitle, date: taskDate)
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "plus.circle")
                    Text("Add Task")
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                //.background(Color.blue)
                .foregroundColor(.white)
            .cornerRadius(8)
            }
            .padding()
            
            Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                        .cornerRadius(8)
                }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    AddItemView(viewModel: ToDoViewModel())
}

