//
//  AccountSheet.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import SwiftUI

struct AccountSheet: View {
    
    var body: some View {
        NavigationView{
            VStack {
                HeaderAccountView()
                Spacer()
                InfoList()
                ProfileLogoutButton()
                Spacer()
                Footer()
                
            }
            .navigationBarHidden(true)
        }
    }
}

struct AccountSheet_Previews: PreviewProvider {
    static var previews: some View {
        AccountSheet()
    }
}





struct InfoList: View {
    var body: some View {
        List{
            Text("О нас")
                .font(.body)
                .frame(height: 35)
            Text("Контакты")
                .font(.body)
                .frame(height: 35)

        }
        .listStyle(.grouped)
    }
}

struct Footer: View {
    var body: some View {
        VStack {
            Text("Zefir Dress")
            Text("Разработчик Роман Замолотов(с).\nВсе права защищены.")
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
        .padding()
    }
}



