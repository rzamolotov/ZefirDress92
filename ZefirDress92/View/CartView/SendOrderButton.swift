//
//  Send.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 10.04.2023.
//

import SwiftUI
import SwiftSMTP

struct SendOrderButton: View {
    @ObservedObject var userDataVM = UserDataViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: DressOrder.entity(), sortDescriptors: [])
    var orders: FetchedResults<DressOrder>
    @State var showProfileView: Bool = false
    @StateObject var orderVM: OrderViewModel
    
    var body: some View {
        Button(action: {
            if userDataVM.editUserName == "Введите ваше имя" || userDataVM.editUserPhone == "Введите ваш номер телефона" || userDataVM.editUserName == "" || userDataVM.editUserPhone == "" {
                showProfileView = true
            } else {
                orderVM.sendMail()
                //TODO: добавить алерт отпавки заказов, что заказ успешно оптавлен
            }
        }) {
            Text("Оформить заказ")
                .frame(width: screen.width / 1.1, height: screen.height / 12)
                .cornerRadius(10)
                .font(.custom(boldFont, size: fontSizeMediuPlus))
                .foregroundColor(colorBege)
                .background(colorBrightPink)
                .cornerRadius(10)
        }
        .sheet(isPresented: $showProfileView, content: {
            ProfileView(editUserName: $userDataVM.editUserName, editUserSurname: $userDataVM.editUserSurname, editUserPhone: $userDataVM.editUserPhone, editUserEmail: $userDataVM.editUserEmail, editUserAdress: $userDataVM.editUserAdress)
        })
        .padding(.leading)
        .padding(.trailing)
        .padding(.bottom)
    }
}

struct SendOrderButton_Previews: PreviewProvider {
    static var userDataVM = UserDataViewModel()
    static var previews: some View {
        SendOrderButton(orderVM: OrderViewModel(userDataVM: userDataVM))
    }
}
