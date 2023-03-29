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
        VStack {
            AsyncImage(url: URL(string: product.image_link)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: screen.width / 2.3, height: screen.height / 4)
                    .padding(.bottom)
                    .cornerRadius(10)
                    .shadow(radius: 2)
            } placeholder: {
                ProgressView()
            }
            
            VStack(spacing: 2) {
                Text(product.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .opacity(0.9)
                Text("аренда от \(product.price_photo) руб.")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .opacity(0.9)
                HStack {
                    Text("Размеры")
                        .font(.footnote)
                        .foregroundColor(.black)
                        .opacity(0.9)
                    ForEach(product.size, id: \.self) { sizes in
                        Text("\(sizes.rawValue)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                            .opacity(0.7)
                    }
                }
            }
        }
        .frame(width: screen.width / 2.3, height: screen.height / 2.9)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product.example)
    }
}
