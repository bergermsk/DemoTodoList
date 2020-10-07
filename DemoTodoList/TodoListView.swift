//
//  TodoListView.swift
//  DemoTodoList
//
//  Created by David on 25.09.2020.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel = TodoListViewModel()
    @State var isShowingAddNew = false
    
    private var addNewButton: some View {
        Button (action: {
            self.isShowingAddNew.toggle()
        }, label: {
            Image (systemName: "plus")
        })
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.todos) {todo in
                TodoRow(todo: todo)
            }
            .navigationBarTitle("Todo List")
            .navigationBarItems(trailing: addNewButton)
        }
        .sheet(isPresented: $isShowingAddNew, onDismiss: {
            self.viewModel.fetchTodos()
        }) {
            NewTodoView(viewModel: NewTodoViewModel())
        }
        .onAppear {
            self.viewModel.fetchTodos()
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        var view = TodoListView()
        view.viewModel = TodoListViewModel(dataManager: MockDataManager())
        return view
    }
}

