//
//  ItemDescriptionView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 27.02.2023.
//

import SwiftUI

struct ItemDescriptionView: View {
    
    @EnvironmentObject var productProvider: ProductProvider
    var product: Product
    @State var isSet: Bool
    
    @State private var presentAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                HStack{
                    FavoriteButtonView(isSet: $isSet, product: product)
                    
                    ItemSizeCheckView(product: product)
                }
                Text(product.description)
                
                HStack {
                    Spacer()
                    Text("Выберете тип аренды и мероприятие")
                    Spacer()
                }
                
                ItemPriceView(product: product)
            }
            .font(.custom(regularFont, size: 15))
            .foregroundColor(.black)
            
            AddToCartButton(product: product, presentAlert: $presentAlert)
        }
        .padding(.bottom, 20)
        .padding([.leading, .trailing])
        .frame(width: screen.width, height: screen.height / 2)
        
    }
}

struct ItemDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDescriptionView(product: example, isSet: false)
            .environmentObject(ProductProvider())
    }
}
