//
//  UserDetailView.swift
//  TestSwiftUIApp
//
//  Created by Visakh Vijayakumaran on 23/06/25.
//

import SwiftUI

struct UserDetailView: View {
    let user: User

    var body: some View {
        VStack(spacing: 20) {
            Text(user.name)
                .font(.largeTitle)
                .bold()
            Text(user.fullname)
                .font(.subheadline)
            Spacer()
        }
        .padding()
        .navigationTitle("User Details")
    }
}

//#Preview {
//    UserDetailView()
//}
