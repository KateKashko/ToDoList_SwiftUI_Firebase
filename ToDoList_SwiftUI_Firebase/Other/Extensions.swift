//
//  Extensions.swift
//  ToDoList_SwiftUI_Firebase
//
//  Created by Kate Kashko on 2.08.2023.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
            
        }
        do {
            let json =  try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
