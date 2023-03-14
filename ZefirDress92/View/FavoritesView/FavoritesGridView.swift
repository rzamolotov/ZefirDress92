//
//  FavoritesGridView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import SwiftUI

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
                    VStack{
                        Spacer()
                        
                        Image("Olivia")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .clipped()
                            .cornerRadius(150)
                            .padding(.bottom, 75)
                            .padding(.top, 25)
                        Text("-Zefir Dess-")
                            .foregroundColor(.pink)
                            .opacity(0.7)
                            .padding(.bottom)
                            .font(.largeTitle)
                        Text("Тут пока ничего нет, но скоро будут платья, которые ты решишь отложить на потом")
                            .foregroundColor(.pink)
                            .opacity(0.9)
                            .font(.subheadline)
                            .padding([.leading, .trailing])
                    }
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
