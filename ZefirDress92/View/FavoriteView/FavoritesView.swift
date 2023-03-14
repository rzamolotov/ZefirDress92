//
//  FavoritesView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 13.03.2023.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var shop: Shop
    var products: [Product]
    
    var filteredProducts: [Product] {
        products.filter { product in
            product.isAddToFavorite
        }
    }
    
    var body: some View {
        ZStack{
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: gridLayout) {
                        //TODO: ForEach for columns
                        ForEach(filteredProducts) { product in
                            NavigationLink {
                                ItemDetailView(product: product)
                            } label: {
                                VStack {
                                    ProductView(product: product)
                                }
                            }

                        }
                    }
                }
                .navigationTitle("Избранные платья")
            }
            if(filteredProducts.count == 0) {
                VStack{
                    Image("Olivia")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(150)
                        .padding(.bottom)
                    Text("-Zefir Dess-")
                        .foregroundColor(.pink)
                        .opacity(0.7)
                        .font(.largeTitle)
                        .padding(.bottom)
                    Text ("Вы еще не  добавили ни одно платье в избранное.")
                        .font(.headline)
                        .foregroundColor(.pink)
                        .opacity(0.7)
                }
                .padding()
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var products = ModelData().products
    static var previews: some View {
        FavoritesView(products: products)
    }
}
