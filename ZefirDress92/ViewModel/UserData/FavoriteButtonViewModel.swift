//
//  FavoriteButtonViewModel.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 02.05.2023.
//

import Foundation
import CoreData

class FavoriteButtonViewModel: ObservableObject {
    
    @Published var isAddToFavorite: Bool
    private var viewContext: NSManagedObjectContext
    var product: Product
    
    init(viewContext: NSManagedObjectContext, product: Product) {
        self.isAddToFavorite = false
        self.viewContext = viewContext
        self.product = product
        checkIsAddToFavorite()
    }
    
    func checkIsAddToFavorite() {
        let fetchRequest: NSFetchRequest<AddToFavorites> = AddToFavorites.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", product.id)
        do {
            let results = try viewContext.fetch(fetchRequest)
            isAddToFavorite = !results.isEmpty
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func toggleIsAddToFavorite() {
        let fetchRequest: NSFetchRequest<AddToFavorites> = AddToFavorites.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", product.id)
        do {
            let results = try viewContext.fetch(fetchRequest)
            if let favorite = results.first {
                // объект с таким идентификатором уже есть в базе данных, удаляем его
                viewContext.delete(favorite)
                try viewContext.save()
                isAddToFavorite = false
                print("favorite deleted")
            } else {
                // объекта с таким идентификатором нет в базе данных, добавляем новый объект
                let newFavorite = AddToFavorites(context: viewContext)
                newFavorite.id = product.id
                newFavorite.availability = product.availability
                newFavorite.category = product.category as NSArray
                newFavorite.condition = product.condition
                newFavorite.deposit = Int64(product.deposit)
                newFavorite.imageLink = product.image_link as? NSArray
                newFavorite.isAddToFavorite = product.isAddToFavorite
                newFavorite.itemDescription = product.description
                newFavorite.itemLink = product.link
                newFavorite.price = product.price
                newFavorite.price_photo = Int64(product.price_photo)
                newFavorite.price_rent = Int64(product.price_rent ?? 0)
                newFavorite.size = product.size as NSArray
                newFavorite.title = product.title
                try viewContext.save()
                isAddToFavorite = true
                print("favorite saved")
            }
            self.objectWillChange.send() // уведомление SwiftUI об изменении объекта
        } catch {
            print(error.localizedDescription)
        }
    }
}
