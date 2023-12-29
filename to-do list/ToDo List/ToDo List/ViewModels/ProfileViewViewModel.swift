//
//  ProfileViewViewModel.swift
//  ToDo List
//
//  Created by aryan on 28/12/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
    init(){}
    
    @Published var user: User? = nil
    
    func fetcUser(){
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot , error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email:  data["email"] as? String ?? "",
                                  joined:  data["joined"] as? TimeInterval ?? 0)
            }
        }
    }
    
    func LogOut(){
        do {
            try Auth.auth().signOut()
        } catch {
            print (error)
        }
    }
}
