//
//  HeaderAccountView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 15.04.2023.
//

import SwiftUI

struct HeaderAccountView: View {
    @State var goToProfile: Bool = false
    @State private var editUserName: String = UserDefaults.standard.string(forKey: userName) ?? "Введите ваше имя"
    @State private var editUserSurname: String = UserDefaults.standard.string(forKey: userSurname) ?? "Введите вашу фамилию"
    @State private var editUserPhone: String = UserDefaults.standard.string(forKey: userPhone) ?? "Введите ваш номер телефона"
    @State private var editUserEmail: String = UserDefaults.standard.string(forKey: userEmail) ?? "Введите ваш Email"
    @State private var editUserAdress: String = UserDefaults.standard.string(forKey: userAdress) ?? "Введите ваш адрес"
    
    var body: some View {
        VStack(spacing: 5){
            Text(editUserName)
            Text(editUserSurname)
            Text(editUserPhone)
            Text(editUserEmail)
            Text(editUserAdress)
            
            Button{
                goToProfile.toggle()
            } label: {
                Text("Редактировать")
                    .font(.caption)
                    .padding(10)
            }
            .sheet(isPresented: $goToProfile) {
                ProfileView(editUserName: $editUserName, editUserSurname: $editUserSurname, editUserPhone: $editUserPhone, editUserEmail: $editUserEmail, editUserAdress: $editUserAdress)
            }
        }
    }
}



struct HeaderAccountView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAccountView()
    }
}
