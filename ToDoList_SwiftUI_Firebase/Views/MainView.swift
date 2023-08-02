//
//  ContentView.swift
//  ToDoList_SwiftUI_Firebase
//
//  Created by Kate Kashko on 1.08.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
    
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                //signed in
               accountView() // на видео без скобок
            } else {
                LoginView()
            }
    }
    @ViewBuilder
    func accountView() -> some View { //на видео без скобок, вместо стрелки :
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
