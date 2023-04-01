//
//  ProductJSON.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 31.03.2023.
//

import Foundation

struct ProductJSON: Decodable {
    
    private enum ProductsCodingKeys: String, CodingKey {
        case products
    }
    private enum ItemCodingKeys: String, CodingKey {
        case item
    }
    
    private(set) var products: [Product] = []
    
    init(from decoder: Decoder) throws {
        let productContainer = try decoder.container(keyedBy: ProductsCodingKeys.self)
        var itemsContainer = try productContainer.nestedUnkeyedContainer(forKey: .products)
        
        while !itemsContainer.isAtEnd {
            let propertiesContainer = try itemsContainer.nestedContainer(keyedBy: ItemCodingKeys.self)
            
            if let item = try? propertiesContainer.decode(Product.self, forKey: .item) {
                products.append(item)
            }
        }
    }
    
}
