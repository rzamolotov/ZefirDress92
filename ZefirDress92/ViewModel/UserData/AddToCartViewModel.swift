//
//  AddToCartViewModel.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 02.05.2023.
//

import Foundation
import CoreData

class AddToCartViewModel: ObservableObject {
    
    @Published var isAddToCart: Bool
    private var viewContext: NSManagedObjectContext
    var product: Product
    
    
    init(viewContext: NSManagedObjectContext, product: Product) {
        self.isAddToCart = false
        self.viewContext = viewContext
        self.product = product
        checkIsAddToCart()
    }
    
    func checkIsAddToCart() {
        let fetchRequest: NSFetchRequest<DressOrder> = DressOrder.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", product.id)
        do {
            let results = try viewContext.fetch(fetchRequest)
            isAddToCart = !results.isEmpty
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func toggleIsAddToCart() {
        let fetchRequest: NSFetchRequest<DressOrder> = DressOrder.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", product.id)
        do {
            let results = try viewContext.fetch(fetchRequest)
            if results.isEmpty {
                // объекта с таким идентификатором еще нет в базе данных, сохраняем новый объект
                let newOrder = DressOrder(context: viewContext)
                newOrder.id = product.id
                newOrder.availability = product.availability
                newOrder.category = product.category as NSArray
                newOrder.condition = product.condition
                newOrder.deposit = Int64(product.deposit)
                newOrder.imageLink = product.image_link as? NSArray
                newOrder.isAddToFavorite = product.isAddToFavorite
                newOrder.itemDescription = product.description
                newOrder.itemLink = product.link
                newOrder.price = product.price
                newOrder.price_photo = Int64(product.price_photo)
                newOrder.price_rent = Int64(product.price_rent ?? 0)
                newOrder.size = product.size as NSArray
                newOrder.title = product.title
                try viewContext.save()
                // TODO: - сделать алерт с уведомлением, о том что позиция добавлена в корзину
                print("order saved")
            } else {
                // TODO: - сделать алерт с уведомлением, что такой заказ уже есть бъект с таким идентификатором уже есть в базе данных, не сохраняем новый объект
                isAddToCart = true
                print("order already exists")
            }
        } catch {
            // TODO: - сделать алерт с уведомлением об ошибке добавление в корщину
            print(error.localizedDescription)
        }
    }
    
    func addToCartAllertFlag() {
        
    }
}
