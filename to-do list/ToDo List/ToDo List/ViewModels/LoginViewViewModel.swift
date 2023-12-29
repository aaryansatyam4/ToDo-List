//
//  LoginViewViewModel.swift
//  ToDo List
//
//  Created by aryan on 28/12/23.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errormsg = ""
    
    init(){}
    
    func login(){
        
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail :email, password: password)
        
    }
    
    private func validate() -> Bool {
        errormsg = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errormsg = "Fill all the fields"
            return false
        }
        
        // email@bla.com
        guard email.contains("@") && email.contains(".") else{
            errormsg = "please enter valid email"
            return false
        }
        return true
    }
}
