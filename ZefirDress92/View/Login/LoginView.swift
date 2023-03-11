//
//  LoginView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.03.2023.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var authSuccess: Bool = false
    @State var authFailure: Bool = false
    @State var skipAuth: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                
                SkipButton(skipAuth: $skipAuth)
                
                Spacer()
                
                BrandLogo()
                
                Spacer()
                
                UserName(username: $username)
                
                Password(password: $password)
                
                if(authFailure){ //consider making this as alert
                    Text("Неправильно введен логин или пароль! Попытайтесь снова.")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.pink)
                        .opacity(0.7)
                        .offset(y: -10)
                }
                
                LoginButton(username: $username, password: $password, authSuccess: $authSuccess, authFailure: $authFailure)
                
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(ViewRouter())
    }
}

