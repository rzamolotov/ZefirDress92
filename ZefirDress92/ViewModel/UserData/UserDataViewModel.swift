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
    @AppStorage(eventType) var editEventType: String = ""
    @AppStorage(deliveryDate) var editDeliveryDate: Date = Date()
    @AppStorage(eventDate) var eventDateString: Date = Date()
    
    init() {
        print("currently logged save data \(editUserName), \(editUserSurname)") //текущий пользователь
        print("current user contacts \(editUserPhone), \(editUserAdress), event type \(editEventType)") //текущие данные доставки
        print("current user delivery date \(editDeliveryDate), event date ") //текущие данные доставки
    }
    
    func isPhoneNumberValid(_ phoneNumber: String) -> Bool {
        let phoneRegex = #"^\+7 \d{3} \d{3}-\d{2}-\d{2}$"#
        let predicate = NSPredicate(format:"SELF MATCHES %@", phoneRegex)
        return predicate.evaluate(with: phoneNumber)
    }
    func clearAllUserData() {
        editUserName = ""
        editUserSurname = ""
        editUserPhone = ""
        editUserAdress = ""
        editEventType = ""
    }
}

extension Date: RawRepresentable {
    private static let formatter = ISO8601DateFormatter()
    
    public var rawValue: String {
        Date.formatter.string(from: self)
    }
    
    public init?(rawValue: String) {
        self = Date.formatter.date(from: rawValue) ?? Date()
    }
}

