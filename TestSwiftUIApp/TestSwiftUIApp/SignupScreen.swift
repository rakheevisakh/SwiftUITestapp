//
//  SignupScreen.swift
//  TestSwiftUIApp
//
//  Created by Visakh Vijayakumaran on 21/06/25.
//

import SwiftUI

struct SignupScreen: View {
    @State private var username = ""
      @State private var fullname = ""
      @State private var password = ""
      @State private var confirmPassword = ""
      @State private var showAlert = false
      @State private var alertMessage = ""
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Create Account")) {
                    TextField("Username", text: $username, onEditingChanged: { isEditing in
                        if !isEditing {
                            validateFields()
                        }
                    })
                    
                    TextField("Full Name", text: $fullname, onEditingChanged: { isEditing in
                        if !isEditing {
                            validateFields()
                        }
                    })
                    SecureField("Password", text: $password)
                        .onSubmit {
                            validateFields()
                        }

                    SecureField("Confirm Password", text: $confirmPassword)
                        .onSubmit {
                            validateFields()
                        }
                }
            }
            Button("Signup") {
                dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(!isFormValid).padding(.horizontal)
        }
          
           .navigationTitle("Sign Up")
           .toolbar {
               ToolbarItem(placement: .navigationBarTrailing) {
                   Button(action: {
                       dismiss()
                   }) {
                       Text("Close")
                   }
               }
           }
           .alert(isPresented: $showAlert) {
               Alert(title: Text("Invalid Input"),
                     message: Text(alertMessage),
                     dismissButton: .default(Text("OK")))
           }
       
       }

       private func validateFields() {
           if username.count < 3 || fullname.count < 3 {
               alertMessage = "Username and Full Name must be at least 3 characters."
               showAlert = true
           } else if !confirmPassword.isEmpty && password != confirmPassword {
               alertMessage = "Passwords do not match."
               showAlert = true
           } else {
               showAlert = false
           }
       }
    private var isFormValid: Bool {
           username.count >= 3 &&
           fullname.count >= 3 &&
           password == confirmPassword
       }
   }

#Preview {
    SignupScreen()
}
