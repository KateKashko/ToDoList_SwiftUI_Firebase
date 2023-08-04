//
//  ProfileView.swift
//  ToDoList_SwiftUI_Firebase
//
//  Created by Kate Kashko on 1.08.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    init() {
        
    }
    var body: some View {
        NavigationStack {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
   
                } else {
                    Text ("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
        .padding()
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.black)
            .frame(width: 125, height: 125)
            .padding()
        
        //Info
        Form {
            VStack(alignment: .leading) {
                HStack {
                    Text("Name: ")
                    Text(user.name)
                }
                HStack {
                    Text("Email: ")
                    Text(user.email)
                }
                HStack {
                    Text("Member Since: ")
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                }
            }
            .padding()
            TLButton(
                title: "Log Out",
                background: .red
            ) {
                viewModel.logOut()
            }
            .padding()
        }
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
