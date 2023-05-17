//
//  Send.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 10.04.2023.
//

import SwiftUI
import SwiftSMTP

struct SendOrderButton: View {
    @StateObject var userDataVM = UserDataViewModel()
    @ObservedObject var orderVM: OrderViewModel
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: DressOrder.entity(), sortDescriptors: [])
    var orders: FetchedResults<DressOrder>
    @State private var alertType: AlertType = .sendMail
    
    enum AlertType {
        case sendMail, showIncorrectPhoneAllert, incorrectName,  failToSendOrder, toManyItems
    }
    @State private var showAlert: Bool = false
    
    @State var showProfileView: Bool = false
    @State var showIncorrectPhoneAllert: Bool = false
    @State var incorrectName: Bool = false
    @State var sendMail: Bool = false
    @State var failToSendOrder: Bool = false
    
    var body: some View {
        Button(action: {
            if userDataVM.editUserName == "" {
                alertType = .incorrectName
                showAlert = true
            } else if userDataVM.editUserPhone == "" {
                alertType = .showIncorrectPhoneAllert
                showAlert = true
            } else if orders.count > 10 {
                alertType = .toManyItems
            } else if orderVM.failToSendOrder == true {
                alertType = .failToSendOrder
                showAlert = true
            } else {
                orderVM.sendMail()
                showAlert = true
                alertType = .sendMail
            }
            
        }) {
            Text("Забронировать платья на примерку")
                .frame(width: screen.width / 1.1, height: screen.height / 12)
                .cornerRadius(10)
                .font(.custom(boldFont, size: fontSizeMediuPlus))
                .foregroundColor(colorBege)
                .background(colorBrightPink)
                .cornerRadius(10)
        }
        .alert(isPresented: $showAlert, content: {
            switch alertType {
            case .sendMail:
                return Alert(
                    title: Text("Заказ успешно отправлен"),
                    message: Text("Скоро мы с вами свяжемся и уточним детали"),
                    dismissButton: .cancel(Text("Хорошо")))
            case .toManyItems:
                return Alert(
                    title: Text("Превышено количество товаров на доставку"),
                    message: Text("Пожалуйста оставьте в своей корзине не более 10 товаров"),
                    dismissButton: .cancel(Text("Хорошо")))
            case .showIncorrectPhoneAllert:
                return Alert(
                    title: Text("Неверный формат номера телефона"),
                    message: Text("Пожалуйста введите корректный номер телефона"),
                    dismissButton: .cancel(Text("Хорошо"), action: {
                        showProfileView = true
                    }))
            case .incorrectName:
                return Alert(
                    title: Text("Нет имени"),
                    message: Text("Пожалуйста введите ваше имя"),
                    dismissButton: .cancel(Text("Хорошо"), action: {
                        showProfileView = true
                    }))
                
            case .failToSendOrder:
                return Alert(
                    title: Text("Ошибка отправки заказа"),
                    message: Text("Пожалуйста, попробуйте отправить заказ еще раз или свяжитесь с нами по телефону"),
                    dismissButton: .cancel(Text("Хорошо")))
                
            }
        })
        .sheet(isPresented: $showProfileView, content: {
            ProfileView()
        })
        .padding([.leading, .trailing, .bottom])
    }
}

struct SendOrderButton_Previews: PreviewProvider {
    static var userDataVM = UserDataViewModel()
    static var previews: some View {
        SendOrderButton(orderVM: OrderViewModel(userDataVM: userDataVM))
            .environmentObject(UserDataViewModel())
    }
}
