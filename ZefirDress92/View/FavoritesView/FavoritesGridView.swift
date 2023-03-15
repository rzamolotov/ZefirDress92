//
//  FavoritesGridView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import SwiftUI
import CoreData

struct FavoritesGridView: View {
    
    
    var products: [Product]
    
    
    
    
    var filteredProducts: [Product] {
        products.filter { product in
            product.isAddToFavorite
        }
    }
    
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: columnSpacing) {
                    ForEach(filteredProducts) { product in
                        NavigationLink {
                            ItemDetailView(product: product)
                        } label: {
                            ProductView(product: product)
                        }
                    }
                   
                }
                .navigationTitle("Избранное")
                if(filteredProducts.count == 0) {
                   EmptyFavoritesView()
                }
            }
        }
    }
}

struct FavoritesGridView_Previews: PreviewProvider {
    static var products = ModelData().products
    static var previews: some View {
        FavoritesGridView(products: products)
    }
}
