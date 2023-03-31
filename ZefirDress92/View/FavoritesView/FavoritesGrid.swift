//
//  FavoritesGrid.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 30.03.2023.
//

import SwiftUI

struct FavoritesGrid: View {
    @EnvironmentObject var productProvider: ProductProvider
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var presentAlert: Bool
    var product: Product
    var productIndex: Int {
        productProvider.products.firstIndex(where: { $0.id == product.id }) ?? 0
    }
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.1)
                .shadow(radius: 5)
            HStack{
                FavoriteImageView(product: product)
                FavoriteTitleTextView(isSet: $productProvider.products[productIndex].isAddToFavorite, presentAlert: $presentAlert, product: product)
            }
        }
        .frame(width: screen.width / 1.1, height: screen.height / 5)
        .cornerRadius(10)
    }
}

//struct FavoritesGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesGrid(presentAlert: .constant(false), product: Product.example)
//            .environmentObject(ProductProvider())
//    }
//}
