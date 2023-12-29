//
//  MainViewViewModel.swift
//  ToDo List
//
//  Created by aryan on 28/12/23.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        let handler = Auth.auth().addStateDidChangeListener{[weak self]_, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
