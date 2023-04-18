//
//  Send.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 10.04.2023.
//

import SwiftUI
import SwiftSMTP

struct Send: View {
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
                subject: "Заказ на доставку от клиента \( UserDefaults.standard.string(forKey: "UserSurname") ?? "Клиент не добавил свое имя и фамилию.")",
                text: "That was my ultimate wish."
            )
       
            smtp.send(mail) { (error) in
                if let error = error {
                    print(error)
                }
            }
        }) {
            Text("Send message")
        }
    }
}

struct Send_Previews: PreviewProvider {
    static var previews: some View {
        Send()
    }
}
