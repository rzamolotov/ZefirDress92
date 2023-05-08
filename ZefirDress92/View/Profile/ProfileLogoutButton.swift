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
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        Button(action: {
            showAlert = true
            userDataVM.editUserName = ""
            userDataVM.editUserSurname = ""
            userDataVM.editUserPhone = ""
            userDataVM.editUserAdress = ""
        }) {
            Text("Удалить персональные данные")
                .font(.custom(mediumFont, size: fontSizeSmall))
                .foregroundColor(colorBege)
                .padding()
                .frame(width: screen.width / 1.4, height: screen.height / 19)
                .background(colorBrightPink)
                .cornerRadius(20)
        }
        .alert(isPresented: $showAlert){
            Alert(
                title: Text("Вы уверены, что хотите удалить персональные данные?"),
                primaryButton: .destructive((Text("Да"))) {
                    withAnimation(){
                        viewRouter.currentPage = .login
                    }
                },
                secondaryButton: .cancel(Text("Нет"))
            )
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width > 0 {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
        )
        .navigationBarHidden(true)
    }
}

struct ProfileLogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileLogoutButton()
    }
}
