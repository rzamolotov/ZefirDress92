//
//  FavoriteAddToFavoriteItem.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 30.03.2023.
//

import SwiftUI

struct FavoriteAddToFavoriteItem: View {
    
    @Binding var isSet: Bool
    @Environment(\.managedObjectContext) private var viewContext
    var product: Product
    
    var body: some View {
        Button {
            isSet.toggle()
            let newFavorite = AddToFavorites(context: viewContext)
            newFavorite.id = product.id
            newFavorite.availability = product.availability
            newFavorite.category = product.category as NSArray
            newFavorite.condition = product.condition
            newFavorite.deposit = Int64(product.deposit)
            newFavorite.image_link = product.image_link
            newFavorite.isAddToFavorite = product.isAddToFavorite
            newFavorite.itemDescription = product.description
            newFavorite.itemLink = product.link
            newFavorite.price = product.price
            newFavorite.price_photo = Int64(product.price_photo)
            newFavorite.price_rent = Int64(product.price_rent ?? 0)
            newFavorite.size = product.size as NSArray
            newFavorite.title = product.title
            do {
                try viewContext.save()
                print("favorite saved")
            } catch {
                print(error.localizedDescription)
            }
        } label: {
            Image(systemName: isSet ? "heart.fill" : "heart")
                .foregroundColor(.pink)
                .opacity(0.7)
                .frame(width: screen.width / 11, height: screen.width / 11, alignment: .center)
                .background(Color.white.cornerRadius(5))
                .background(RoundedRectangle(cornerRadius: 5).stroke(.pink, lineWidth:2))
        }
    }
}

struct FavoriteAddToFavoriteItem_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteAddToFavoriteItem(isSet: .constant(false), product: example)
    }
}
