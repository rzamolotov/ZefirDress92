//
//  ProductGridView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct ProductGridView: View {
    
    var products: [Product]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                ForEach(products) { product in
                    NavigationLink(
                        destination: ItemDetailView(product: product)) {
                            ProductView(product: product)
                        }
                }
            })
        }
        .padding([.trailing, .leading])
    }
    
}

struct ProductGridView_Previews: PreviewProvider {
    static var products = ModelData().products
    static var previews: some View {
        ProductGridView(products: products)
    }
}
