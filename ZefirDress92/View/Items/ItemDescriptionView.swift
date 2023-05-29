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
    @State private var presentAlert = false
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack(spacing: 20) {
            Text(product.title)
                .font(.custom(mediumFont, size: fontSizeSmall))
                .foregroundColor(colorFont)
            VStack(alignment: .leading, spacing: 20) {
                HStack{
                    Text("Ты можешь отправить ссылку на \(product.title) или добавить его в избранное.")
                        .font(.custom(lightFont, size: fontSizeVerySmall))
                        .foregroundColor(colorFont)
                    Spacer()
                    FavoriteButtonView(favoriteButtonVM: FavoriteButtonViewModel(viewContext: viewContext, product: product))
                    ItemShareButton(product: product)
                    
                }
                HStack{
                    ItemSizeCheckView(product: product)
                }
                
                Text(product.description)
                    .font(.custom(regularFont, size: fontSizeMedium))
                    .foregroundColor(colorFont)
                HStack {
                    Spacer()
                    Text("Cтоимость аренды")
                        .font(.custom(boldFont, size: fontSizeMedium))
                        .foregroundColor(colorFont)
                    Spacer()
                }
                
                ItemPriceView(product: product)
            }
            .foregroundColor(.black)
            
            AddToCartButton(product: product, addToCartButtonVM: AddToCartViewModel(viewContext: viewContext, product: product))
                .padding(.bottom)
        }
        .padding(.bottom)
        .padding([.leading, .trailing])
    }
    
}


struct ItemDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDescriptionView(product: example)
            .environmentObject(ProductProvider())
        
    }
}
