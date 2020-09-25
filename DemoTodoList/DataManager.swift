//
//  DataManager.swift
//  DemoTodoList
//
//  Created by David Mardashev on 25.09.2020.
//

import Foundation

protocol DataManagerProtocol {
    func fetchTodoList(includingCompleted: Bool) -> [Todo]
    func add(todo: Todo)
    func toggleIsCompleted(for todo: Todo)
}

extension DataManagerProtocol {
    func fetchTodoList(includingCompleted: Bool = true) -> [Todo] {
        fetchTodoList(includingCompleted: includingCompleted)
    }
}

class DataManager {
    static let shared: DataManagerProtocol = DataManager()
    private var todos = [Todo]()
    private init() {}
}

extension DataManager: DataManagerProtocol {
    func fetchTodoList(includingCompleted: Bool = false) -> [Todo] {
        includingCompleted ? todos : todos.filter { !$0.isComplete }
    }
    
    func add(todo: Todo) {
        todos.insert(todo, at: 0)
    }
    
    func toggleIsCompleted(for todo: Todo) {
        if let index = todos.firstIndex(where: {$0.id == todo.id}) {
            todos[index].isComplete.toggle()
        }
    }
    
}
