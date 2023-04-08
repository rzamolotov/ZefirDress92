//
//  ProductView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI
import Kingfisher

struct ProductView: View {
    
    @EnvironmentObject var productProvider: ProductProvider
    var product: Product
    
    var body: some View {
        VStack {
            KFImage(URL(string: product.image_link))
                .placeholder { progress in
                    ProgressView()
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screen.width / 2.5, height: screen.height / 4)
                .cornerRadius(10)
                .padding(.bottom)
                .shadow(radius: 2)
            
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
                        Text("\(sizes)")
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
        ProductView(product: example)
    }
}
