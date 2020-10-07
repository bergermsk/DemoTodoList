//
//  NewTodoViewModel.swift
//  DemoTodoList
//
//  Created by David on 26.09.2020.
//

import Foundation
import Combine

protocol NewTodoViewModelProtocol {
    func addNewTodo(title: String)
}

final class NewTodoViewModel: ObservableObject {
    var dataManager: DataManagerProtocol
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
    }
}

extension NewTodoViewModel: NewTodoViewModelProtocol {
    func addNewTodo(title: String) {
        dataManager.addTodo(title: title)
    }
}
