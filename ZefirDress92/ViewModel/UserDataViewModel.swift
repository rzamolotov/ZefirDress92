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
    
    @Published var editUserEmail: String {
        didSet {
            UserDefaults.standard.set(editUserEmail, forKey: userEmail)
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
    
    init() {
        self.editUserName = UserDefaults.standard.object(forKey: userName) as? String ?? "Введите ваше имя"
        self.editUserSurname = UserDefaults.standard.object(forKey: userSurname) as? String ?? "Введите вашу фамилию"
        self.editUserPhone = UserDefaults.standard.object(forKey: userPhone) as? String ?? "Введите ваш номер телефона"
        self.editUserEmail = UserDefaults.standard.object(forKey: userEmail) as? String ?? "Введите ваш Email"
        self.editUserAdress = UserDefaults.standard.object(forKey: userAdress) as? String ?? "Введите ваш Email"
        
        
        print("currently logged save data \(editUserName), \(editUserSurname)") //текущий пользователь
        print("current user contacts \(editUserPhone), \(editUserEmail), \(editUserAdress)") //текущие данные доставки
        
    }
}
    
   
    
//    func saveUserData(){
//        userName = UserDefaults.standard.set(editUserName, forKey: userName)
//        userSurname = UserDefaults.standard.set(editUserSurname, forKey: userSurname)
//        userPhone = UserDefaults.standard.set(editUserPhone, forKey: userPhone)
//        userEmail = UserDefaults.standard.set(editUserEmail, forKey: userEmail)
//        userAdress = UserDefaults.standard.set(editUserAdress, forKey: userAdress)
//        
//    }
//}


