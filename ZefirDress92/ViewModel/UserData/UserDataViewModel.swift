//
//  UserDataDefaults.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 01.05.2023.
//

import Foundation
import SwiftUI

class UserDataViewModel: ObservableObject {
    static let shared = UserDataViewModel()
    
    @AppStorage(userName) var editUserName: String = ""
    @AppStorage(userSurname) var editUserSurname: String = ""
    @AppStorage(userPhone) var editUserPhone: String = ""
    @AppStorage(userAdress) var editUserAdress: String = ""
    @AppStorage(deliveryDate) var deliveryDateString: String = ""
    @AppStorage(eventDate) var eventDateString: String = ""
    
    var editDeliveryDate: Date {
        get {
            if let date = DateFormatter().date(from: deliveryDateString) {
                return date
            } else {
                return Date()
            }
        }
        set {
            deliveryDateString = DateFormatter().string(from: newValue)
        }
    }
    
    var editEventDate: Date {
        get {
            if let date = DateFormatter().date(from: eventDateString) {
                return date
            } else {
                return Date()
            }
        }
        set {
            eventDateString = DateFormatter().string(from: newValue)
        }
    }
    
    
    init() {
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

