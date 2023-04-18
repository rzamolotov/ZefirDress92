//
//  Send.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 10.04.2023.
//

import SwiftUI
import SwiftSMTP

struct SendOrderButton: View {
    private var userName: String = UserDefaults.standard.string(forKey: "UserName") ?? "Пользователь не ввел своё имя"
    private var userSurname: String = UserDefaults.standard.string(forKey: "UserSurname") ?? "Пользователь не ввел свою имя фамилию"
    private var userPhone: String = UserDefaults.standard.string(forKey: "UserPhone") ?? "Пользователь не ввел свой номер телефона"
    private var userEmail: String = UserDefaults.standard.string(forKey: "UserEmail") ?? "Пользователь не ввел свой Email"
    private var userAdress: String = UserDefaults.standard.string(forKey: "UserAdress") ?? "Пользователь не ввел свой адрес"
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: DressOrder.entity(), sortDescriptors: [])
    var orders: FetchedResults<DressOrder>
    
    var body: some View {
        Button(action: {
            let smtp = SMTP(
                hostname: "smtp.yandex.ru",     // SMTP server address
                email: "zefirdress@yandex.ru",        // username to login
                password: "zaxs12CD"            // password to login
            )
            let zefirDress92 = Mail.User(name: "Юлия Замолотова", email: "zefirdress@yandex.ru")
            let rzamolotov = Mail.User(name: "Роман Замолотов", email: "rzamolotov@yandex.ru")
            
            let mail = Mail(
                from: zefirDress92,
                to: [rzamolotov],
                subject: "Заказ на доставку от клиента \(userName) \(userSurname)",
                text: "Имя\(userName), фамилия \(userSurname)\nНомер телефона \(userPhone), email \(userEmail)\n адрес доставки \(userAdress)\n\n\n"
            )
            DispatchQueue.main.async {
                smtp.send(mail) { (error) in
                    if let error = error {
                        print(error)
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
