//
//  OrderViewModel.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 02.05.2023.
//

import Foundation
import SwiftSMTP
import SwiftUI

class OrderViewModel: ObservableObject {
    
    var userDataVM = UserDataViewModel()
    @Published var showToManyItemsAllert: Bool
    
    init(userDataVM: UserDataViewModel) {
        self.userDataVM = userDataVM
        self.showToManyItemsAllert = false
    }
    
    func sendMail() {
        let smtp = SMTP(
            hostname: "smtp.yandex.com",             // SMTP server address
            email: "zefirdress@yandex.ru",           // username to login
            password: "zaxs12CD"                     // password to login
        )
        
        let zefirDress92 = Mail.User(name: "Юлия Замолотова", email: "zefirdress@yandex.ru")
        let rzamolotov = Mail.User(name: "Заказ", email: "zefirdress@yandex.ru")
        
        let mail = Mail(
            from: zefirDress92,
            to: [rzamolotov],
            subject: "Заказ на доставку от клиента \(userDataVM.editUserName) \(userDataVM.editUserSurname)",
            text: "Имя \(userDataVM.editUserName), фамилия \(userDataVM.editUserSurname)\nНомер телефона \(userDataVM.editUserPhone), \nадрес доставки \(userDataVM.editUserAdress)"
        )
        DispatchQueue.global(qos: .background).async {
            smtp.send(mail) { (error) in
                if let error = error {
                    print(error)
                }
            }
        }
    }
    
    func updateAlertFlag(orders: FetchedResults<DressOrder>) {
        if orders.count > 10 {
            showToManyItemsAllert = true
        } else {
            showToManyItemsAllert = false
        }
    }
}
    
