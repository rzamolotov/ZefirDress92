//
//  ProductGridView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct ProductGridView: View {
    
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        
        //MARK: - Header
        ScrollView {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                ForEach(products) { product in
                    NavigationLink(
                        destination: ItemDetailView(product: product, numberOfProducts: shop.products.count)) {
                            ProductView(product: product)
                        }
                }
            })
        }
        .padding([.trailing, .leading])

    }
}

struct ProductGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProductGridView()
    }
}
