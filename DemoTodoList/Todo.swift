//
//  Todo.swift
//  DemoTodoList
//
//  Created by David Mardashev on 25.09.2020.
//

import Foundation

struct Todo: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}
