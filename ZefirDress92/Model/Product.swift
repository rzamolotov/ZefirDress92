//
//  Product.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import Foundation

struct Product: Codable, Equatable, Identifiable {
    var id = UUID()
    let reference: String
    let size: [Int]
    let category: [String]
    let name: String
    let price_photo: Int
    let price_rent: Int
    let image: [String]
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case reference, name, size, category, price_photo, price_rent, image, description
    }
    
#if DEBUG
    static let example = Product(
        reference: "001-567",
        size: [42, 44, 48],
        category: ["night", "sweet", "dance"],
        name: "Платье Amabel",
        price_photo: 1500,
        price_rent: 2500,
        image: ["Amabel", "Jennifer", "Kayla"],
        description: "Белое платье, состоящее из юбки с 3х метровым шлейфом и двумя вариантами топов ('американка' и вариант с рукавами).")
#endif
}
