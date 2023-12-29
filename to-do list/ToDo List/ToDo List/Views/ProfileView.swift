//
//  ProfileView.swift
//  ToDo List
//
//  Created by aryan on 28/12/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack{
                // AVTAR
                if let user = viewModel.user{
                    profile(user: user)
                }
                else {
                    Text("Loading Profile ....")
                }
            }
            .navigationTitle("PROFILE")
        }
        .onAppear{
            viewModel.fetcUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width:125,height: 125)
            .padding()
        //INFO
        
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            
            HStack{
                Text("EMAIL: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            
            HStack{
                Text("MEMBER SINCE: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened ))")
            }
            .padding()
            
        }
        .padding()
        
        //SIGNOUT
        
        Button("LogOut"){
            viewModel.LogOut()
        }
        .tint(.red)
        .padding()
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
