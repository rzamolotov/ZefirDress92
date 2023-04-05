//
//  RealmManager.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 05.04.2023.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var realmModel: [RealmModel] = []
    
    init(){
        openRealm()
    }
    
    func openRealm(){
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        } catch {
            print("Error opening realm\(error)")
        }
    }
    
    func addToFavorite(){
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newFavoriteItem = RealmModel(value: ["isAddToFavorite" : false])
                    localRealm.add(newFavoriteItem)
                    getFavorites()
                    print("Added new item to favorite")
                }
            } catch {
                print("Error adding task to Realm: \(error)")
            }
        }
    }
    func getFavorites() {
        if let localRealm = localRealm {
            let allFavorites = localRealm.objects(RealmModel.self).sorted(byKeyPath: "isAddToFavorite")
            realmModel = []
            allFavorites.forEach { favorites in
                realmModel.append(favorites)
            }
        }
    }
    func updateFavorites(id: ObjectId, isAddToFavorite: Bool) {
        if let localRealm = localRealm {
            do {
                let itemToUpdate = localRealm.objects(RealmModel.self).filter(NSPredicate(format: "id == $@", id))
                guard !itemToUpdate.isEmpty else { return }
                
                try localRealm.write {
                    itemToUpdate[0].isAddToFavorite = isAddToFavorite
                    getFavorites()
                    print("Updating favorites with id \(id)! Favorite status \(isAddToFavorite)")
                }
            } catch {
                print("Error upadating favorites\(id) to Realm \(error)")
            }
        }
    }
    func deleteFavorites(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let itemToDelete = localRealm.objects(RealmModel.self).filter(NSPredicate(format: "id == $@", id))
                guard !itemToDelete.isEmpty else { return }
                
                try localRealm.write {
                    localRealm.delete(itemToDelete)
                    getFavorites()
                    print("Delitig favorites with id \(id)!")
                }
            }
        } catch {
            print("Error deliting favorites\(id) to Realm \(error)")
        }
    }
}
