//
//  NewitemView.swift
//  ToDo List
//
//  Created by aryan on 28/12/23.
//

import SwiftUI

struct NewitemView: View {
    @StateObject var viewModel = NewitemViewViewModel()
    @Binding var newItemPresented : Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size:32))
                .bold()
                .padding(.top,100)
            
            Form{
                //title
                TextField("Title",text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //due date
                DatePicker("Due Date", selection:  $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //button
                
                TLButton(title: "Save",background: .accentColor){
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented=false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"), message: Text("Please fill all the details and select due date newer than today"))

            }
        }
    }
}

struct NewitemView_Previews: PreviewProvider {
    static var previews: some View {
        NewitemView(newItemPresented: Binding(get: {
            return true
        }, set: {
            _ in
        }
                                             ))
    }
}
