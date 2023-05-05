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
                HeaderViewHomeScreen()
                Spacer()
                VStack(alignment: .leading) {
                    NavigationLink("Данные для доставки") {
                        ProfileView()
                    }
                    .foregroundColor(colorBrightPink)
                    .font(.custom(boldFont, size: fontSizeLarge))
                    .padding(.bottom)
                    
                    NavigationLink("О нас") {
                        AboutUsView()
                    }
                    .foregroundColor(colorBrightPink)
                    .font(.custom(boldFont, size: fontSizeLarge))
                    .padding(.bottom)
                    
                    NavigationLink("Условия работы") {
                        WorkConditionsView()
                    }
                    .foregroundColor(colorBrightPink)
                    .font(.custom(boldFont, size: fontSizeLarge))
                    .padding(.bottom)
                    
                    NavigationLink("Контакты") {
                        ContactsView()
                    }
                    .foregroundColor(colorBrightPink)
                    .font(.custom(boldFont, size: fontSizeLarge))
                }
                .multilineTextAlignment(.leading)
                
                Spacer()
                ProfileLogoutButton()
                VStack {
                    Text("Zefir Dress")
                    Text("Разработчик Роман Замолотов(с).\nВсе права защищены.")
                }
                .font(.custom(lightFont, size: fontSizeSmall))
                .foregroundColor(colorFont)
                .padding(.bottom, 50)
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

