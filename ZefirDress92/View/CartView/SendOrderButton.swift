//
//  Send.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 10.04.2023.
//

import SwiftUI
import SwiftSMTP

struct SendOrderButton: View {
    @State private var editUserName: String = UserDefaults.standard.string(forKey: userName) ?? "Введите ваше имя"
    @State private var editUserSurname: String = UserDefaults.standard.string(forKey: userSurname) ?? "Введите вашу фамилию"
    @State private var editUserPhone: String = UserDefaults.standard.string(forKey: userPhone) ?? "Введите ваш номер телефона"
    @State private var editUserEmail: String = UserDefaults.standard.string(forKey: userEmail) ?? "Введите ваш Email"
    @State private var editUserAdress: String = UserDefaults.standard.string(forKey: userAdress) ?? "Введите ваш адрес"
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: DressOrder.entity(), sortDescriptors: [])
    var orders: FetchedResults<DressOrder>
    @State var showProfileView: Bool = false
    
    var body: some View {
        Button(action: {
            if editUserName == "Введите ваше имя" || editUserPhone == "Введите ваш номер телефона" {
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
                    subject: "Заказ на доставку от клиента \(editUserName) \(editUserSurname)",
                    text: "Имя\(editUserName), фамилия \(editUserSurname)\nНомер телефона \(editUserPhone), email \(editUserEmail)\nадрес доставки \(editUserAdress)"
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
            ProfileView(editUserName: $editUserName, editUserSurname: $editUserSurname, editUserPhone: $editUserPhone, editUserEmail: $editUserEmail, editUserAdress: $editUserAdress)
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
