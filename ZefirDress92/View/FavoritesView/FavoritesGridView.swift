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
                        ItemDetailView(id: product.id, title: product.title, size: product.size, price_photo: product.price_photo, price_rent: product.price_rent ?? 0, deposit: product.deposit, description: product.description, link: product.link, image_link: product.image_link, availability: product.availability, price: product.price, condition: product.condition, isAddToFavorite: product.isAddToFavorite, category: product.category)
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
