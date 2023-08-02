//
//  ToDoListItemsView.swift
//  ToDoList_SwiftUI_Firebase
//
//  Created by Kate Kashko on 1.08.2023.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        
    }
    var body: some View {
       NavigationStack {
           VStack {
               
           }
           .navigationTitle("To Do List")
           .toolbar {
               Button {
                   viewModel.showingNewItemView = true
               } label: {
                   Image(systemName: "plus")
               }
           }
           .sheet(isPresented: $viewModel.showingNewItemView) {
               NewItemView(newItemPresented: $viewModel.showingNewItemView)
           }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}
