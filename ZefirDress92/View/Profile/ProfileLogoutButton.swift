//
//  ProfileLogoutButton.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 03.05.2023.
//

import SwiftUI

struct ProfileLogoutButton: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var userDataVM = UserDataViewModel()
    @State private var showAlert: Bool = false
    
    var body: some View {
        Button(action: {
            showAlert = true
            userDataVM.editUserName = ""
            userDataVM.editUserSurname = ""
            userDataVM.editUserPhone = ""
            userDataVM.editUserAdress = ""
        }) {
            Text("Выйти")
                .font(.custom(mediumFont, size: fontSizeMedium))
                .foregroundColor(colorBege)
                .padding()
                .frame(width: screen.width / 3, height: screen.height / 19)
                .background(colorBrightPink)
                .cornerRadius(20)
        }
        .alert(isPresented: $showAlert){
            Alert(
                title: Text("Вы уверены, что хотите выйти?"),
                primaryButton: .destructive((Text("Да"))) {
                    withAnimation(){
                        viewRouter.currentPage = .login
                    }
                },
                secondaryButton: .cancel(Text("Нет"))
            )
        }
        
    }
}

struct ProfileLogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileLogoutButton()
    }
}
