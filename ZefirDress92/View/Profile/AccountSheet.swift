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
                LogOutButton()
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



struct LogOutButton: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var userDataVM = UserDataViewModel()
    @State private var showAlert: Bool = false
    
    var body: some View {
        Button(action: {
            showAlert = true
            userDataVM.editUserName = ""
            userDataVM.editUserSurname = ""
            userDataVM.editUserEmail = ""
            userDataVM.editUserPhone = ""
            userDataVM.editUserAdress = ""
        }) {
            Text("Выйти")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: screen.width / 3, height: screen.height / 19)
                .background(Color.pink)
                .opacity(0.7)
                .cornerRadius(15.0)
        }
        .alert(isPresented: $showAlert){
            Alert(
                title: Text("Вы уверены, что хотите выйти?"),
                primaryButton: .destructive((Text("Да"))) {
                    withAnimation(){
                        viewRouter.currentPage = .login
                    }
                },
                secondaryButton: .cancel()
            )
        }
        
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



