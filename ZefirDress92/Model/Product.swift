//
//  Product.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import Foundation

struct Product: Identifiable, Equatable, Decodable {
    var id = UUID()
    var title: String
    var size: [Size]
    var price_photo: Int
    var price_rent: Int?
    var deposit: Int
    var description: String
    var link: String
    var image_link: String
    var isAddToFavorite: Bool
    var category: [Category]
    
    enum CodingKeys: String, CodingKey {
        case title, size, price_photo, price_rent, deposit, description, link, image_link, isAddToFavorite, category
    }
    
    init(id: UUID = UUID(), title: String, size: [Size], price_photo: Int, price_rent: Int? = nil, deposit: Int, description: String, link: String, image_link: String, isAddToFavorite: Bool, category: [Category]) {
        self.id = id
        self.title = title
        self.size = size
        self.price_photo = price_photo
        self.price_rent = price_rent
        self.deposit = deposit
        self.description = description
        self.link = link
        self.image_link = image_link
        self.isAddToFavorite = isAddToFavorite
        self.category = category
    }
    
    
    enum Category: String, CaseIterable, Codable {
        case dance = "Платья для бала"
        case night = "Вечерние платья"
        case fotosession = "Платья для фотосессии"
        case kids = "Детские"
    }
    
    enum Size: String, CaseIterable, Codable {
        case size38 = "38"
        case size40 = "40"
        case size42 = "42"
        case size44 = "44"
        case size46 = "46"
        case size48 = "48"
        case size50 = "50"
        case size8 = "8"
        case size12 = "12"
        case size74 = "74"
        case size76 = "76"
        case size78 = "78"
        case size80 = "80"
        case size82 = "82"
        case size84 = "84"
        case size86 = "86"
        case size88 = "88"
        case size90 = "90"
        case size92 = "92"
        
    }
    
    
#if DEBUG
    static let example = Product(
        title: "Платье Amabel",
        size: [Product.Size.size40, Product.Size.size42, Product.Size.size44],
        price_photo: 1500,
        price_rent: 2500,
        deposit: 1000,
        description: "Белое платье, состоящее из юбки с 3х метровым шлейфом и двумя вариантами топов ('американка' и вариант с рукавами).",
        link: "https://zefirdress.ru/vseplatya/accessuars",
        image_link: "http://shop-cdn1.vigbo.tech/shops/195624/products/21750271/images/preview-54001b28d11190b216a1f972ba2e5c91.JPG",
        isAddToFavorite: false,
        category: [Category.dance]
    )
#endif
}

