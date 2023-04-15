//
//  HeaderAccountView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 15.04.2023.
//

import SwiftUI

struct HeaderAccountView: View {
    @State var goToProfile: Bool = false
    @State private var userName: String = UserDefaults.standard.string(forKey: "UserName") ?? "Введите ваше имя"
    @State private var userSurname: String = UserDefaults.standard.string(forKey: "UserSurname") ?? "Введите вашу фамилию"
    @State private var userPhone: String = UserDefaults.standard.string(forKey: "UserPhone") ?? "Введите ваш номер телефона"
    @State private var userEmail: String = UserDefaults.standard.string(forKey: "UserEmail") ?? "Введите ваш Email"
    @State private var userAdress: String = UserDefaults.standard.string(forKey: "UserAdress") ?? "Введите ваш адрес"
    
    var body: some View {
        VStack(spacing: 5){
            Text(userName)
            Text(userSurname)
            Text(userPhone)
            Text(userEmail)
            Text(userAdress)
            
            Button{
                goToProfile.toggle()
            } label: {
                Text("Редактировать")
                    .font(.caption)
                    .padding(10)
            }
            .sheet(isPresented: $goToProfile) {
                ProfileView(userName: $userName, userSurname: $userSurname, userPhone: $userPhone, userEmail: $userEmail, userAdress: $userAdress)
            }
        }
    }
}



struct HeaderAccountView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAccountView()
    }
}
