//
//  FavoritesGridView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import SwiftUI
import CoreData

struct FavoritesGridView: View {
    
    @State var presentAlert: Bool
    var products: [Product]
    var filteredProducts: [Product] {
        products.filter { product in
            product.isAddToFavorite
        }
    }
    
    var body: some View {
        NavigationView{
            ScrollView {
                ForEach(filteredProducts) { product in
                    NavigationLink {
                        ItemDetailView(product: product)
                    } label: {
                        FavoritesGrid(presentAlert: $presentAlert, product: product)
                    }
                }
                if(filteredProducts.count == 0) {
                    EmptyFavoritesView()
                }
            }
            .navigationTitle("Избранное")
        }
    }
}

struct FavoritesGridView_Previews: PreviewProvider {
    static var products = ProductProvider().products
    static var previews: some View {
        FavoritesGridView(presentAlert: false, products: products)
    }
}
