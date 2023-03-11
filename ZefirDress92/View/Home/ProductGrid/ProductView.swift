//
//  ProductView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct ProductView: View {
    let product: Product
    
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(.clear)
            VStack {
                Image(product.image[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: screen.width / 2, height: screen.height / 4)
                    .padding(.bottom)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                VStack(spacing: 2) {
                    Text(product.name)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("аренда от \(product.price_photo) руб.")
                        .font(.subheadline)
                    HStack {
                        Text("Размеры")
                            .font(.footnote)
                        ForEach(product.size, id: \.self) { sizes in
                            Text("\(sizes)")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.pink)
                                .opacity(0.7)
                        }
                    }
                }
            }
        }
        .frame(width: screen.width / 2, height: screen.height / 2.9)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product.example)
    }
}
