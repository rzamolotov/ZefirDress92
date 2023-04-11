//
//  ProductProvider.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 31.03.2023.
//

import Foundation

@MainActor
class ProductProvider: ObservableObject {
    
    @Published var products: [Product] = []

    let network: Network
  
    func fetchProducts() async throws {
        let latestProducts = try await network.products
        self.products = latestProducts
    }

    init(network: Network = Network()) {
        self.network = network
    }

    var categories: [String: [Product]] {
        Dictionary(
            grouping: products,
            by: { $0.category.first! }
        )
    }// словарь для категорий
    
    var sizes: [String: [Product]] {
        Dictionary(
            grouping: products,
            by: { $0.size.first! }
        )
    }// словарь для размеров
}


