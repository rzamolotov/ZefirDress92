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
        let size = ["Small", "Medium", "Large"]
        let category = ["Dresses", "Tops", "Bottoms"]
        let sizeFavorite = ["Small", "Medium", "Large"]
        let categoryFavorite = ["Dresses", "Tops", "Bottoms"]
        
        for i in 0..<5 {
            let newItem = DressOrder(context: viewContext)
            newItem.id = "\(i)"
            newItem.availability = "in stock"
            newItem.condition = "new"
            newItem.deposit = 1000
            newItem.image_link = "https://spbnevesta.ru/upload/dress/475/25032023155011-oliviya.webp"
            newItem.isAddToFavorite = i % 2 == 0
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
            newFavorite.id = "\(i)"
            newFavorite.availability = "in stock"
            newFavorite.condition = "new"
            newFavorite.deposit = 1000
            newFavorite.image_link = "https://spbnevesta.ru/upload/dress/475/25032023155011-oliviya.webp"
            newFavorite.isAddToFavorite = i % 2 == 0
            newFavorite.itemDescription = "замечательное платье"
            newFavorite.itemLink = "https://spbnevesta.ru/upload/dress/475/25032023155011-oliviya.webp"
            newFavorite.price = "1444"
            newFavorite.price_photo = 1000
            newFavorite.price_rent = 1500
            newFavorite.productName = "Платье Оливия"
            newFavorite.title = "Платье"
            newFavorite.size = sizeFavorite as NSArray
            newFavorite.category = categoryFavorite as NSArray
            
            let newPerson = PersonalData(context: viewContext)
            newPerson.name = "Roman"
            newPerson.surname = "Zamolotov"
            newPerson.email = "rzamolotov@gmail.com"
            newPerson.phoneNumber = "+79788278094"
            newPerson.adress = "Sevastopol"
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            print("Error saving context: \(nsError), \(nsError.userInfo)")
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
                print("Error loading persistent store: \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
