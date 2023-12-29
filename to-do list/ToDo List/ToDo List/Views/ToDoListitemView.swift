//
//  ToDoListitemVies.swift
//  ToDo List
//
//  Created by aryan on 28/12/23.
//

import SwiftUI

struct ToDoListitemView: View {
    @StateObject var viewModel = ToDoListitemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated,time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color (.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item : item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.cyan)
            }
        }
        
    }
}

struct ToDoListitemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListitemView(item: ToDoListItem(
            id: "123",
            title: "trial going",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: true
        ))
    }
}

