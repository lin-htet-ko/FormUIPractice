//
//  ContentView.swift
//  FormUIPractice
//
//  Created by Lin Htet Ko Macbook Pro on 14/8/2568 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State var username = ""
    @State var usernameError = ""
    @State var email = ""
    @State var emailError = ""
    @State var password = ""
    @State var passwordError = ""
    @State var showSuccess = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Sign Up")
                .font(.system(size: 50, weight: .semibold))
                .foregroundStyle(.white)
            Text("Username")
                .foregroundStyle(.white)
                .font(.title3)
                .fontWeight(.medium)
            TextField(text: $username, label: {})
                .textFieldStyle(.roundedBorder)
            if !usernameError.isEmpty {
                Text(usernameError)
                    .foregroundStyle(.red)
                    .font(.system(size: 15, weight: .semibold))
            }
            Text("Email")
                .foregroundStyle(.white)
                .font(.title3)
                .fontWeight(.medium)
            TextField(text: $email, label: {})
                .textFieldStyle(.roundedBorder)
            if !emailError.isEmpty {
                Text(emailError)
                    .foregroundStyle(.red)
                    .font(.system(size: 15, weight: .semibold))
            }
            Text("Password")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundStyle(.white)
            SecureField(text: $password, label: {})
                .textFieldStyle(.roundedBorder)
            if !passwordError.isEmpty {
                Text(passwordError)
                    .foregroundStyle(.red)
                    .font(.system(size: 15, weight: .semibold))
            }
            Button(action: {
                guard !username.isEmpty else {
                    usernameError = "Username is required"
                    return
                }
                
                guard !email.isEmpty else {
                    emailError = "Email is required"
                    return
                }
                
                guard !password.isEmpty else {
                    passwordError = "Password is required"
                    return
                }
                
                usernameError = ""
                emailError = ""
                passwordError = ""
                
                showSuccess = true
            }, label: {
                Text("Submit")
                    .fontWeight(.semibold)
                    .foregroundStyle(.yellow)
                    .padding(.vertical, 12)
            }).frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top, 10)
                Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(.yellow)
        .alert("Sign up was successful", isPresented: $showSuccess, actions: {
            Button(action: {
                showSuccess = false
            }, label: {
                Text("OK")
            })
        }, message: {
            Text("You completed the signing up process successfully")
        })
    }
}

#Preview {
    ContentView()
}
