//
//  ToDoListViewViewModel.swift
//  ToDo List
//
//  Created by aryan on 28/12/23.
//
import FirebaseFirestore
import Foundation
// viewModel for list of items view
//primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id delete
    func delete(id : String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
