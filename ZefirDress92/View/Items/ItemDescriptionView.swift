//
//  ItemDescriptionView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 27.02.2023.
//

import SwiftUI

struct ItemDescriptionView: View {
    
    var product: Product
    
    var body: some View {
        ZStack {
            Rectangle()
            VStack {
                Text("\(product.price_photo) руб.")
                    .fontWeight(.bold)
                    .padding()
                
                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding()
                Spacer()
                AddToCartButton(product: self.product)
                    .padding()
                
            }
        }
        .frame(width: screen.width / 1.05, height: screen.height / 2)
        .cornerRadius(screen.width / 10)
        .foregroundColor(colorBackground)
        .shadow(radius: 3)
    }
}

struct ItemDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDescriptionView(product: Product.example)
    }
}
