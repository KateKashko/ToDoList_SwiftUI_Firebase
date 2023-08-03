//
//  ToDoListItemsView.swift
//  ToDoList_SwiftUI_Firebase
//
//  Created by Kate Kashko on 1.08.2023.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
    }
    var body: some View {
       NavigationStack {
           VStack {
               List(items) { item in
                   ToDoListItemView(item: item)
                       .swipeActions {
                           Button {
                               viewModel.delete(id: item.id)
                               
                           } label: {
                               Text("Delete")
                                   .foregroundColor(.red)
                           }
                       }
               }
               .listStyle(PlainListStyle())
               
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
        ToDoListView(userId: "u3uAl2HPIDfgS2mQMbpCfHBFfXh1")
    }
}
