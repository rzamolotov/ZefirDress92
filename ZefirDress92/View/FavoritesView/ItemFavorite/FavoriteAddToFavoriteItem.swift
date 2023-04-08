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
    var favorite: AddToFavorites
    
    var body: some View {
        Button {
            isSet.toggle()
            let newFavorite = AddToFavorites(context: viewContext)
            newFavorite.id = favorite.id
            newFavorite.availability = favorite.availability
            newFavorite.category = favorite.category as? NSArray
            newFavorite.condition = favorite.condition
            newFavorite.deposit = Int64(favorite.deposit)
            newFavorite.image_link = favorite.image_link
            newFavorite.isAddToFavorite = favorite.isAddToFavorite
            newFavorite.itemDescription = favorite.description
            newFavorite.itemLink = favorite.itemLink
            newFavorite.price = favorite.price
            newFavorite.price_photo = Int64(favorite.price_photo)
            newFavorite.price_rent = Int64(favorite.price_rent)
            newFavorite.size = favorite.size as? NSArray
            newFavorite.title = favorite.title
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
    static var favorite = AddToFavorites()
    static var previews: some View {
        FavoriteAddToFavoriteItem(isSet: .constant(false), favorite: favorite)
    }
}
