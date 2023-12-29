//
//  LoginView.swift
//  ToDo List
//
//  Created by aryan on 28/12/23.
//

import SwiftUI

struct LoginView: View {
   @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                //header
                HeaderView(title: "KARO DHARO", subtitle: "YOUR OWN TODO LIST APP", angle: 10, background: .indigo)
                    .offset(y: -10)
                
                
                
                //loginform
                Form{
                    if !viewModel.errormsg.isEmpty {
                        Text(viewModel.errormsg)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address",text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Enter Password",text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title:"Log in",background: .blue){
                        //attempt login
                        viewModel.login()
                    }
                    
                }
                .offset(y:-160)
                .padding(.top,100)
                .padding(.bottom,-150)
                //createaccount
                NavigationLink(destination: RegisterView().navigationBarHidden(true)) {
                    Text("Create Account")
                        .foregroundColor(.blue)
                        .underline()
                }

                
                
                
                
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
