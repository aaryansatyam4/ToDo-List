//
//  ToDoListitemviewViewModel.swift
//  ToDo List
//
//  Created by aryan on 28/12/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// viewModel for a singlt todolist of items (each row in item list)
class ToDoListitemViewViewModel: ObservableObject {
    
    
    //naya
    
    init(){}
    func toggleIsDone(item : ToDoListItem){
        var ItemCopy = item
        ItemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(ItemCopy.id)
            .setData(ItemCopy.asDictionary())
        
        
    }
}
