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
        VStack {
            ItemSizeCheckView(product: product)
                .padding()
                .foregroundColor(.gray)
            
            Text(product.description)
                .font(.body)
                .foregroundColor(.secondary)
                .padding()
            
            VStack{
                Text("Выберете тип аренды и мероприятие")
                    .font(.subheadline)
                ItemPriceView(product: product)
            }
                .foregroundColor(.secondary)
                .padding()
            
            AddToCartButton(product: self.product)
                .padding()
        }
        .frame(width: screen.width, height: screen.height / 2)
        
    }
}

struct ItemDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDescriptionView(product: Product.example)
    }
}
