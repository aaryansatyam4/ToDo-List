//
//  ToDo_ListApp.swift
//  ToDo List
//
//  Created by aryan on 28/12/23.
//
import FirebaseCore
import SwiftUI

@main
struct ToDo_ListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
