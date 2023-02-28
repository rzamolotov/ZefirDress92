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
                .foregroundColor(.white)
            VStack {
                Image(product.image[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: screen.width / 2.25, height: screen.height / 4)
                    .padding(.bottom)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.headline)
                        .foregroundColor(colorBlue)
                    Text("\(product.price_photo) руб.")
                        .foregroundColor(colorBlue)
                }
            }
        }
        .frame(width: screen.width / 2, height: screen.height / 3)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product.example)
    }
}
