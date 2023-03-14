//
//  Product.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import Foundation

struct Product: Codable, Identifiable, Hashable {
    var id = UUID()
    let size: [Int]
    let name: String
    let price_photo: Int
    let price_rent: Int
    let image: [String]
    let description: String
    var isAddToFavorite: Bool
    var category: Category
    
    enum Category: String, CaseIterable, Codable {
        case dance = "Платья для бала"
        case night = "Вечерние платья"
        case fotosession = "Платья для фотосессии"
    }
    
    enum CodingKeys: String, CodingKey {
        case name, size, category, price_photo, price_rent, image, description, isAddToFavorite
    }
   
    
#if DEBUG
    static let example = Product(
        size: [42, 44, 48],
        name: "Платье Amabel",
        price_photo: 1500,
        price_rent: 2500,
        image: ["Amabel", "Jennifer", "Kayla"],
        description: "Белое платье, состоящее из юбки с 3х метровым шлейфом и двумя вариантами топов ('американка' и вариант с рукавами).",
        isAddToFavorite: true,
        category: Product.Category.night
    )
#endif
}
