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
        let image_linkitem = ["https://i.ibb.co/ZVV0T0H/IMG-3445.jpg", "https://i.ibb.co/nD300vq/IMG-3450.jpg", "https://i.ibb.co/khHxhKc/IMG-3451.jpg", "https://i.ibb.co/Rzw3b1W/IMG-3608.jpg", "https://i.ibb.co/LtjHDQJ/IMG-3609.jpg", "https://i.ibb.co/4168GTG/IMG-3610.jpg", "https://i.ibb.co/34bmM8X/IMG-3612.jpg", "https://i.ibb.co/CbCYTCs/photo-2020-04-28-08-09-57.jpg", "https://i.ibb.co/nRW4chc/photo-2020-04-28-08-10-00.jpg", "https://i.ibb.co/vD2ZSq0/photo-2020-04-28-08-10-02.jpg", "https://i.ibb.co/Zg4596V/photo-2020-04-28-08-10-03.jpg", "https://i.ibb.co/xLG2Ltj/photo-2020-04-28-08-10-07.jpg", "https://i.ibb.co/591dWMv/photo-2020-04-28-08-10-16.jpg", "https://i.ibb.co/qpcGV8m/photo-2020-04-28-12-31-34.jpg", "https://i.ibb.co/vJpYyG1/photo-2020-04-28-12-31-36.jpg", "https://i.ibb.co/BnZk7DL/photo-2020-04-28-12-31-38.jpg", "https://i.ibb.co/6P8skwk/photo-2020-04-28-12-31-40.jpg"]
        let image_linkfavorite = ["https://i.ibb.co/ZVV0T0H/IMG-3445.jpg", "https://i.ibb.co/nD300vq/IMG-3450.jpg", "https://i.ibb.co/khHxhKc/IMG-3451.jpg", "https://i.ibb.co/Rzw3b1W/IMG-3608.jpg", "https://i.ibb.co/LtjHDQJ/IMG-3609.jpg", "https://i.ibb.co/4168GTG/IMG-3610.jpg", "https://i.ibb.co/34bmM8X/IMG-3612.jpg", "https://i.ibb.co/CbCYTCs/photo-2020-04-28-08-09-57.jpg", "https://i.ibb.co/nRW4chc/photo-2020-04-28-08-10-00.jpg", "https://i.ibb.co/vD2ZSq0/photo-2020-04-28-08-10-02.jpg", "https://i.ibb.co/Zg4596V/photo-2020-04-28-08-10-03.jpg", "https://i.ibb.co/xLG2Ltj/photo-2020-04-28-08-10-07.jpg", "https://i.ibb.co/591dWMv/photo-2020-04-28-08-10-16.jpg", "https://i.ibb.co/qpcGV8m/photo-2020-04-28-12-31-34.jpg", "https://i.ibb.co/vJpYyG1/photo-2020-04-28-12-31-36.jpg", "https://i.ibb.co/BnZk7DL/photo-2020-04-28-12-31-38.jpg", "https://i.ibb.co/6P8skwk/photo-2020-04-28-12-31-40.jpg"]
        
        for i in 0..<5 {
            let newItem = DressOrder(context: viewContext)
            newItem.id = "\(i)"
            newItem.availability = "in stock"
            newItem.condition = "new"
            newItem.deposit = 1000
            newItem.imageLink = image_linkitem as NSArray
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
            newFavorite.imageLink = image_linkfavorite as NSArray
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
