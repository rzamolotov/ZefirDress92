//
//  ProductJSON.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 31.03.2023.
//

import Foundation

struct ProductJSON: Decodable {

    private enum RootCodingKeys: String, CodingKey {
        case features
    }

    private enum FeatureCodingKeys: String, CodingKey {
        case properties
    }

    private(set) var products: [Product] = []

    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        var featuresContainer = try rootContainer.nestedUnkeyedContainer(forKey: .features)

        while !featuresContainer.isAtEnd {
            let propertiesContainer = try featuresContainer.nestedContainer(keyedBy: FeatureCodingKeys.self)

            if let properties = try? propertiesContainer.decode(Product.self, forKey: .properties) {
                products.append(properties)
            }
        }
    }
}
