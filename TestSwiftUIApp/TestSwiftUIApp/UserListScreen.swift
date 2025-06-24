//
//  UserListScreen.swift
//  TestSwiftUIApp
//
//  Created by Visakh Vijayakumaran on 21/06/25.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    let name: String
    let fullname: String
}

struct UserListScreen: View {
    let userArray: [User] = [
         User(name: "alice", fullname: "alice george"),
         User(name: "bob", fullname: "bob marley"),
         User(name: "carl", fullname: "carl milton"),
         User(name: "john", fullname: "john smith")
    ]
    
    @State private var showGrid = false
    
    //test
    @State private var isAscending = true
       
       var sortedUsers: [User] {
           userArray.sorted {
               isAscending ? $0.name < $1.name : $0.name > $1.name
           }
       }
    //

    var body: some View {
        NavigationView {
            Group {
                if showGrid {
                    // Grid layout
                    let columns = [GridItem(.flexible()), GridItem(.flexible())]
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(sortedUsers) { user in
                                NavigationLink(destination: UserDetailView(user: user)) {
                                    UserCard(user: user)
                                }
                            }
                        }
                        .padding()
                    }
                } else {
                    // List layout
                    List {
                        ForEach(sortedUsers) { user in
                            NavigationLink(destination: UserDetailView(user: user)) {
                                
                                VStack {
                                    Text("Username: \(user.name)")
                                    Spacer()
                                    Text("Fullname: \(user.fullname)")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .toolbar {
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAscending.toggle()
                    }) {
                        Image(systemName: isAscending ? "arrow.up" : "arrow.down")
                    }
                    
                    Button(action: {
                        showGrid.toggle()
                    }) {
                        Text(showGrid ? "Show list"  : "Show grid")
                    }
                   
                    
                }
            }
        }
    }
}

struct UserCard: View {
    let user: User

    var body: some View {
        VStack {
            Text("Username: \(user.name)")
                .font(.headline)
            Text("Fullname: \(user.fullname)")
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}
