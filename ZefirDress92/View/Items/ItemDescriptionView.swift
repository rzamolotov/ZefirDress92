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
    private let productIndexKey = "productIndex"
        private var savedProductIndex: Int {
            get { UserDefaults.standard.integer(forKey: productIndexKey) }
            set { UserDefaults.standard.set(newValue, forKey: productIndexKey) }
        }
        
        var productIndex: Int {
            productProvider.products.firstIndex(where: { $0.id == product.id }) ?? savedProductIndex
        }
    
    @State private var presentAlert = false
    
    var body: some View {
        VStack {
            HStack {
                FavoriteButtonView(isSet: $productProvider.products[productIndex].isAddToFavorite)
                    .padding([.leading, .trailing])
                    .onAppear {
                        // Retrieve the saved value of isAddToFavorite and update the state
                        productProvider.products[productIndex].isAddToFavorite = UserDefaults.standard.bool(forKey: "isAddToFavorite-\(product.id)")
                    }
                
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

//struct ItemDescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDescriptionView(product: Product.example)
//            .environmentObject(ProductProvider())
//    }
//}
