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
                            ItemDetailView(itemID: product.id)
                        } label: {
                            ProductView(product: product)
                        }
                    }
                }
            }
        }
    }
}

//struct SizesRow_Previews: PreviewProvider {
//    static var products = [Network().dataProduct]
//
//    static var previews: some View {
//        SizesRow(sizeName: "42 размер", products: products)
//    }
//}
