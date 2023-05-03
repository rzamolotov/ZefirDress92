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
            VStack(alignment: .leading, spacing: 20) {
                HStack{
                    Spacer()
                    FavoriteButtonView(favoriteButtonVM: FavoriteButtonViewModel(viewContext: viewContext, product: product))
                    ItemShareButton(product: product)
                   
                }
                HStack{
                    ItemSizeCheckView(product: product)
                }
             
                Text(product.description)
                    .font(.custom(regularFont, size: fontSizeMedium))
                HStack {
                    Spacer()
                    Text("Cтоимость аренды платья")
                        .font(.custom(boldFont, size: fontSizeMedium))
                    Spacer()
                }
                
                ItemPriceView(product: product)
            }
            .foregroundColor(.black)
            
            AddToCartButton(product: product, addToCartButtonVM: AddToCartViewModel(viewContext: viewContext, product: product))
        }
        .padding(.bottom, 20)
        .padding([.leading, .trailing])
        .frame(width: screen.width, height: screen.height / 2)
        
    }
}

struct ItemDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDescriptionView(product: example)
            .environmentObject(ProductProvider())
        
    }
}
