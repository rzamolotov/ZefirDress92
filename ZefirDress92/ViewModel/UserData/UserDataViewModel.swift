//
//  UserDataDefaults.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 01.05.2023.
//

import Foundation
import SwiftUI

class UserDataViewModel: ObservableObject {
    
    @Published var editUserName: String {
        didSet {
            UserDefaults.standard.set(editUserName, forKey: userName)
        }
    }
    
    @Published var editUserSurname: String {
        didSet {
            UserDefaults.standard.set(editUserSurname, forKey: userSurname)
        }
    }
    
    @Published var editUserPhone: String {
        didSet {
            UserDefaults.standard.set(editUserPhone, forKey: userPhone)
        }
    }
    
    @Published var editUserAdress: String {
        didSet {
            UserDefaults.standard.set(editUserAdress, forKey: userAdress)
        }
    }
    
    @Published var editDeliveryDate: Date {
        didSet {
            UserDefaults.standard.set(editDeliveryDate, forKey: deliveryDate)
        }
    }
    
    @Published var editEventDate: Date {
        didSet {
            UserDefaults.standard.set(editEventDate, forKey: eventDate)
        }
    }
    
    init() {
        self.editUserName = UserDefaults.standard.object(forKey: userName) as? String ?? ""
        self.editUserSurname = UserDefaults.standard.object(forKey: userSurname) as? String ?? ""
        self.editUserPhone = UserDefaults.standard.object(forKey: userPhone) as? String ?? ""
        self.editUserAdress = UserDefaults.standard.object(forKey: userAdress) as? String ?? ""
        self.editDeliveryDate = UserDefaults.standard.object(forKey: deliveryDate) as? Date ?? Date()
        self.editEventDate = UserDefaults.standard.object(forKey: eventDate) as? Date ?? Date()
        
        print("currently logged save data \(editUserName), \(editUserSurname)") //текущий пользователь
        print("current user contacts \(editUserPhone), \(editUserAdress)") //текущие данные доставки
        print("current user delivery date \(editDeliveryDate), event date \(editEventDate)") //текущие данные доставки
    }
    
    func isPhoneNumberValid(_ phoneNumber: String) -> Bool {
        let phoneRegex = #"^\+7 \d{3} \d{3}-\d{2}-\d{2}$"#
        let predicate = NSPredicate(format:"SELF MATCHES %@", phoneRegex)
        return predicate.evaluate(with: phoneNumber)
    }
}
