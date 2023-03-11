//
//  LoginButton.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.03.2023.
//

import SwiftUI

struct LoginButton: View {
    @Binding var username: String
    @Binding var password: String
    @Binding var authSuccess: Bool
    @Binding var authFailure: Bool
    @EnvironmentObject var viewRouter: ViewRouter
    
    let validUserName = "123"
    let validPassword = "123"
    
    var body: some View {
        Button(action: { //consider disabling until details are entered
            if (self.username == validUserName && self.password == validPassword) {
                self.authSuccess = true
                self.authFailure = false
                withAnimation(){
                    viewRouter.currentPage = .landing
                }
            } else {
                self.authFailure = true
                self.authSuccess = false
            }
        }) {
            ZStack{
                Rectangle()
                    .frame(width: screen.width / 1.1, height: 60)
                    .foregroundColor(.pink)
                    .opacity(0.7)
                    .cornerRadius(15.0)
                Text("Войти")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}


struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton(username: .constant("123"), password: .constant("123"), authSuccess: .constant(true), authFailure: .constant(false))
    }
}
