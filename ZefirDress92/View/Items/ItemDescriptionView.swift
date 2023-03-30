//
//  ItemDescriptionView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 27.02.2023.
//

import SwiftUI

struct ItemDescriptionView: View {

    @EnvironmentObject var network: Network
    var product: Product
    var productIndex: Int {
        network.dataProduct.firstIndex(where: { $0.id == product.id }) ?? 0
    }
    @State private var presentAlert = false
    
    var body: some View {
        VStack {
            HStack {
                FavoriteButtonView(isSet: $network.dataProduct[productIndex].isAddToFavorite)
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
            
            AddToCartButton(product: product, presentAlert: $presentAlert)
                .padding([.leading, .trailing, .top])
        }
        .frame(width: screen.width, height: screen.height / 2)
        
    }
}

struct ItemDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDescriptionView(product: Product.example)
            .environmentObject(Network())
    }
}
