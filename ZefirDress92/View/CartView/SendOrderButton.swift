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
    
    var body: some View {
        Button(action: {
            if userDataVM.editUserName == "Введите ваше имя" || userDataVM.editUserPhone == "Введите ваш номер телефона" || userDataVM.editUserName == "" || userDataVM.editUserPhone == "" {
                showProfileView = true
            } else {
                let smtp = SMTP(
                    hostname: "smtp.yandex.com",     // SMTP server address
                    email: "zefirdress@yandex.ru",        // username to login
                    password: "zaxs12CD"            // password to login
                )
                let zefirDress92 = Mail.User(name: "Юлия Замолотова", email: "zefirdress@yandex.ru")
                let rzamolotov = Mail.User(name: "Заказ", email: "zefirdress@yandex.ru")
                
                let mail = Mail(
                    from: zefirDress92,
                    to: [rzamolotov],
                    subject: "Заказ на доставку от клиента \(userDataVM.editUserName) \(userDataVM.editUserSurname)",
                    text: "Имя \(userDataVM.editUserName), фамилия \(userDataVM.editUserSurname)\nНомер телефона \(userDataVM.editUserPhone), email \(userDataVM.editUserEmail)\nадрес доставки \(userDataVM.editUserAdress)"
                )
                DispatchQueue.global(qos: .background).async {
                    smtp.send(mail) { (error) in
                        if let error = error {
                            print(error)
                        }
                    }
                }
            }
        }) {
            Text("Оформить заказ")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: screen.width / 1.1, height: 60)
                .background(Color.pink)
                .opacity(0.7)
                .cornerRadius(15.0)
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
    static var previews: some View {
        SendOrderButton()
    }
}
