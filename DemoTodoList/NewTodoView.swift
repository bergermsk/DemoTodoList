//
//  NewTodoView.swift
//  DemoTodoList
//
//  Created by David on 26.09.2020.
//

import SwiftUI

struct NewTodoView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode> // 1
    
    @ObservedObject var viewModel: NewTodoViewModel
    @State private var title = ""
    
    private var isAddButtonDisabled: Bool {
        title.isEmpty
    }
    
    private var addButtonColor: Color {
        isAddButtonDisabled ? .gray : .blue
    }
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Enter Name", text: $title)
            Spacer()
            HStack {
                Button(action: {
                    // cancel action
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }
                .padding(.vertical, 16)
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Button(action: {
                    // add action
                    if !self.isAddButtonDisabled{
                        self.viewModel.addNewTodo(title: title)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Add")
                        .foregroundColor(.black)
                }
                .padding(.vertical, 16)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(addButtonColor)
                .disabled(isAddButtonDisabled)
            }
        }
        .padding()
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(viewModel: NewTodoViewModel())
    }
}
