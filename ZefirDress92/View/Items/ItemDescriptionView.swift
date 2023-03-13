//
//  ItemDescriptionView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 27.02.2023.
//

import SwiftUI

struct ItemDescriptionView: View {
    
    @State var isAddToFavorite = false
    var product: Product
    
    var body: some View {
        VStack {
            HStack {
                FavoriteButtonView(isAddToFavorite: $isAddToFavorite)
                    .padding([.leading, .trailing])
                
                
                ItemSizeCheckView(product: product)
                    .padding([.leading, .trailing])
                    .foregroundColor(.gray)
            }
            
            Text(product.description)
                .font(.body)
                .foregroundColor(.secondary)
                .padding([.leading, .trailing, .top])
            
            VStack{
                Text("Выберете тип аренды и мероприятие")
                    .font(.subheadline)
                ItemPriceView(product: product)
            }
                .foregroundColor(.secondary)
                .padding([.leading, .trailing, .top])
            
            AddToCartButton(product: self.product)
                .padding([.leading, .trailing, .top])
        }
        .frame(width: screen.width, height: screen.height / 2)
        
    }
}

struct ItemDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDescriptionView(product: Product.example)
    }
}
