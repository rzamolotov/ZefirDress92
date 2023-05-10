//
//  OrderViewModel.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 02.05.2023.
//

import Foundation
import SwiftSMTP
import SwiftUI
import CoreData

class OrderViewModel: ObservableObject {
    
    @ObservedObject var userDataVM: UserDataViewModel
    @Published var showToManyItemsAlert: Bool
    let context = PersistenceController.shared.container.viewContext
    
    init(userDataVM: UserDataViewModel) {
        self.userDataVM = userDataVM
        self.showToManyItemsAlert = false
    }
    
    func fetchItems(context: NSManagedObjectContext) -> [String] {
        let request: NSFetchRequest<DressOrder> = DressOrder.fetchRequest()
        
        do {
            let items = try context.fetch(request)
            let title = items.compactMap { $0.title ?? "название неизвестно" }
            return title
        } catch {
            print("Error fetching items: \(error.localizedDescription)")
            return []
        }
    }
    
    func sendMail() {
        let smtp = SMTP(
            hostname: "smtp.yandex.com",
            email: "zefirdress@yandex.ru",
            password: "09125757makren"
        )
        
        let orderName = fetchItems(context: context)
        let zefirDress92 = Mail.User(name: "Юлия Замолотова", email: "zefirdress@yandex.ru")
        let rzamolotov = Mail.User(name: "Заказ", email: "zefirdress@yandex.ru")
        
        let mail = Mail(
            from: zefirDress92,
            to: [rzamolotov],
            subject: "Заказ на доставку от клиента \(userDataVM.editUserName) \(userDataVM.editUserSurname)",
            text: "Имя \(userDataVM.editUserName) \(userDataVM.editUserSurname)\nНомер телефона \(userDataVM.editUserPhone), \nАдрес доставки \(userDataVM.editUserAdress), \nДата примерки \(userDataVM.editDeliveryDate)\nДата мерроприятия \(userDataVM.editEventDate) \n\nСписок платьев на примерку:\n\(orderName)"
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
            showToManyItemsAlert = true
        } else {
            showToManyItemsAlert = false
        }
    }
}
    
