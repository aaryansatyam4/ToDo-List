//
//  User.swift
//  ToDo List
//
//  Created by aryan on 28/12/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
