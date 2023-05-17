//
//  ProfileLogoutButton.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 03.05.2023.
//

import SwiftUI

struct ProfileLogoutButton: View {
    @ObservedObject var userDataVM = UserDataViewModel()
    @State private var showAlert: Bool = false
    @State private var alertType: AlertType = .confirmDeletion
    
    enum AlertType {
        case confirmDeletion
        case successDeletion
        case failDeletion
    }
    
    var body: some View {
        Button(action: {
            showAlert = true
        }) {
            Text("Удалить персональные данные")
                .font(.custom(mediumFont, size: fontSizeSmall))
                .foregroundColor(colorBege)
                .padding()
                .frame(width: screen.width / 1.4, height: screen.height / 19)
                .background(colorBrightPink)
                .cornerRadius(20)
        }
        .alert(isPresented: $showAlert) {
            switch alertType {
            case .confirmDeletion:
                return Alert(
                    title: Text("Вы уверены, что хотите удалить персональные данные?"),
                    primaryButton: .destructive(Text("Да")) {
                        
                        userDataVM.clearAllUserData()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            if userDataVM.editUserName == "" && userDataVM.editUserSurname == "" && userDataVM.editUserPhone == "" && userDataVM.editUserAdress == "" {
                                alertType = .successDeletion
                            } else {
                                alertType = .failDeletion
                            }
                            showAlert = true
                        }
                    },
                    secondaryButton: .cancel(Text("Нет"))
                )
            case .successDeletion:
                return Alert(
                    title: Text("Данные успешно удалены"),
                    dismissButton: .default(Text("Хорошо")) {
                        showAlert = false
                    }
                )
            case .failDeletion:
                return Alert(
                    title: Text("Ошибка удаления данных"),
                    dismissButton: .default(Text("ОК")) {
                        showAlert = false
                    }
                )
            }
        }
    }
}


struct ProfileLogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileLogoutButton()
    }
}
