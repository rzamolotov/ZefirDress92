//
//  Persistance.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        let size = ["S", "M", "L"]
        let category = [""]
        
        for _ in 0..<100 {
            let newItem = DressOrder(context: viewContext)
            newItem.id = "123214"
            newItem.availability = "in stock"
            newItem.condition = "new"
            newItem.deposit = 1000
            newItem.imageName = "Olivia"
            newItem.image_link = ""
            newItem.isAddToFavorite = true
            newItem.itemDescription = ""
            newItem.itemLink = ""
            newItem.price = ""
            newItem.price_photo = 1000
            newItem.price_rent = 1500
            newItem.productName = ""
            newItem.title = ""
            newItem.size = size as NSArray
            newItem.category = category as NSArray
            
            let newFavorite = AddToFavorites(context: viewContext)
            newFavorite.id = "123214"
            newFavorite.availability = "in stock"
            newFavorite.condition = "new"
            newFavorite.deposit = 1000
            newFavorite.imageName = "Olivia"
            newFavorite.image_link = ""
            newFavorite.isAddToFavorite = true
            newFavorite.itemDescription = ""
            newFavorite.itemLink = ""
            newFavorite.price = ""
            newFavorite.price_photo = 1000
            newFavorite.price_rent = 1500
            newFavorite.productName = ""
            newFavorite.title = ""
            newFavorite.size = size as NSArray
            newFavorite.category = category as NSArray
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ProductData")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}

