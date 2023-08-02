//
//  User.swift
//  ToDoList_SwiftUI_Firebase
//
//  Created by Kate Kashko on 1.08.2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
