//
//  RealmManager.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 28.02.2023.
//

import Foundation
import SwiftUI
import RealmSwift

class RealmManager: ObservableObject {
    @EnvironmentObject var shop: Shop
    private(set) var localRealm: Realm?
    
    init() {
        openRealm()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        } catch {
            print("error opening Realm \(error)")
        }
    }
    func addNewOrder() {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newOrder = RealmModel(value: ["name" : shop.selectedProduct?.name ?? "непонятное платье, свяжись с клиентом", "price" : shop.selectedProduct?.price_photo ?? 0])
                    localRealm.add(newOrder)
                    print("added new order to Realm\(newOrder)")
                }
            } catch {
                print("error adding new order to Realm \(error)")
            }
        }
    }
}
