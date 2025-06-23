//
//  ContentView.swift
//  TestSwiftUIApp
//
//  Created by Visakh Vijayakumaran on 21/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showModalView = false
    @State private var navigateToUserList = false

    var body: some View {
        NavigationStack {
        VStack {
            Button("Signup") {
                showModalView.toggle()
            }
            .sheet(isPresented: $showModalView) {
                NavigationView {
                    SignupScreen()
                }
            }.buttonStyle(.borderedProminent).padding()
            
            
            Button("All users") {
                navigateToUserList = true
            }.buttonStyle(.borderedProminent)
            .navigationDestination(isPresented: $navigateToUserList) {
                UserListScreen()
            }.padding()
        }
    }
        .padding()
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupScreen()
    }
}

#Preview {
    ContentView()
}
