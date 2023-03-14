//
//  CategoryRow.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.03.2023.
//

import SwiftUI

struct CategoryRow: View {
    
    @EnvironmentObject var shop: Shop
    var categoryName: String
    var product: Product
    var items: [Product]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 10)
            ScrollView(.horizontal){
                HStack {
                    ForEach(items) { product in
                        NavigationLink {
                            ItemDetailView(product: product)
                        } label: {
                            ProductView(product: product)
                        }
                    }
                }
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    
    static var products = ModelData().products
    
    static var previews: some View {
        CategoryRow(categoryName: products[0].category.rawValue, product: Product.example, items: Array(products.prefix(3)))
    }
}
