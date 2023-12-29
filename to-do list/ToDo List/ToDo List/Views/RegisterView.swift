//
//  RegisterView.swift
//  ToDo List
//
//  Created by aryan on 28/12/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            //header
            HeaderView(title: "KARNA\nSHURU KARO",
                       subtitle: "AAJ SE NAHI BHULOGE",
                       angle: -10,
                       background: .cyan)
            .offset(y: -10)
            Form{
                TextField("Name",text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address",text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                SecureField("Password" ,text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Register", background: .pink){
                    //register
                    viewModel.register()
                }
            }
            .offset(y:-160)
            .padding(.top,100)
            .padding(.bottom,-150)
            VStack{
                Text("Old Here?")
                NavigationLink("Login",
                               destination:LoginView().navigationBarHidden(true))
            
            }
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
