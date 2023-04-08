//
//  SizesRow.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 29.03.2023.
//

import SwiftUI

struct SizesRow: View {
    var sizeName: String
    var products: [Product]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(sizeName)
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 10)
                Spacer()
                NavigationLink {

                    
                } label: {
                    Text("смотреть все")
                        .font(.headline)
                        .padding(.trailing, 15)
                        .padding(.top, 10)
                }
            }
            ScrollView(.horizontal){
                HStack {
                    ForEach(products) { product in
                        NavigationLink {
                            ItemDetailView(id: product.id, title: product.title, size: product.size, price_photo: product.price_photo, price_rent: product.price_rent ?? 0, deposit: product.deposit, description: product.description, link: product.link, image_link: product.image_link, availability: product.availability, price: product.price, condition: product.condition, isAddToFavorite: product.isAddToFavorite, category: product.category)
                        } label: {
                            ProductView(product: product)
                        }
                    }
                }
            }
        }
    }
}

struct SizesRow_Previews: PreviewProvider {
        static var previews: some View {
        SizesRow(sizeName: example.size[0], products: [example])
    }
}
