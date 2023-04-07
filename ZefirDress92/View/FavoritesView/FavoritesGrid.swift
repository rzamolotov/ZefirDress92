//
//  FavoritesGrid.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 30.03.2023.
//

import SwiftUI

struct FavoritesGrid: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: AddToFavorites.entity(), sortDescriptors: [])
    var favorites: FetchedResults<AddToFavorites>
    var product: Product
    
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.1)
                .shadow(radius: 5)
            HStack{
                FavoriteImageView(image_link: product.image_link)
                FavoriteTitleTextView(title: product.title, category: product.category, size: product.size, isSet: false, presentAlert: false)
                
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
