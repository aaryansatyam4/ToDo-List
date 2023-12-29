//
//  ToDoListitemsView.swift
//  ToDo List
//
//  Created by aryan on 28/12/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListitemsView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    
    @FirestoreQuery var items: [ToDoListItem]
    
   
    init(userId:String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    var body: some View {
        NavigationView {
            VStack{
                List(items) { item in
                    ToDoListitemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                //delete
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                        
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("KARO DHARO LIST")
            .toolbar{
                Button {
                    //ACTION
                    viewModel.showingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewitemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListitemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListitemsView(userId: "HqfrlBfX6HWz0vNMnmOuEjxeceX2")
    }
}
