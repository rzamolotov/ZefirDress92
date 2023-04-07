//
//  Product.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import Foundation

struct Product: Identifiable {
    var id: String
    var title: String
    var size: [String]
    var price_photo: Int
    var price_rent: Int?
    var deposit: Int
    var description: String
    var link: String
    var image_link: String
    var availability: String
    var price: String
    var condition: String
    var isAddToFavorite: Bool
    var category: [String]
}

extension Product: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, title, size, price_photo, price_rent, deposit, description, link, image_link, availability, price, condition, isAddToFavorite, category
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let rawid = try? container.decode(String.self, forKey: .id)
        let rawtitle = try? container.decode(String.self, forKey: .title)
        let rawsize = try? container.decode([String].self, forKey: .size)
        let rawprice_photo = try? container.decode(Int.self, forKey: .price_photo)
        let rawprice_rent = try? container.decodeIfPresent(Int.self, forKey: .price_rent)
        let rawdeposit = try? container.decode(Int.self, forKey: .deposit)
        let rawdescription = try? container.decode(String.self, forKey: .description)
        let rawlink = try? container.decode(String.self, forKey: .link)
        let rawimage_link = try? container.decode(String.self, forKey: .image_link)
        let rawavailability = try? container.decode(String.self, forKey: .availability)
        let rawprice = try? container.decode(String.self, forKey: .price)
        let rawcondition = try? container.decode(String.self, forKey: .condition)
        let rawisAddToFavorite = try? container.decode(Bool.self, forKey: .isAddToFavorite)
        let rawcategory = try? container.decode([String].self, forKey: .category)
        
        guard let id = rawid,
              let title = rawtitle,
              let size = rawsize,
              let price_photo = rawprice_photo,
              let price_rent = rawprice_rent,
              let deposit = rawdeposit,
              let description = rawdescription,
              let link = rawlink,
              let image_link = rawimage_link,
              let availability = rawavailability,
              let price = rawprice,
              let condition = rawcondition,
              let isAddToFavorite = rawisAddToFavorite,
              let category = rawcategory
        else {
            throw ProductError.missingData
        }
        
        self.id = id
        self.title = title
        self.size = size
        self.price_photo = price_photo
        self.price_rent = price_rent
        self.deposit = deposit
        self.description = description
        self.link = link
        self.image_link = image_link
        self.availability = availability
        self.price = price
        self.condition = condition
        self.isAddToFavorite = isAddToFavorite
        self.category = category
        
        
    }
}


