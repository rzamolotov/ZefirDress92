//
//  FavoriteAddToCartItem.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 30.03.2023.
//

import SwiftUI

struct FavoriteAddToCartItem: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    var favorite: AddToFavorites
    @Binding var presentAlert: Bool
    
    var body: some View {
        Button(action: {
            let newOrder = DressOrder(context: viewContext)
            newOrder.id = favorite.id
            newOrder.availability = favorite.availability
            newOrder.category = favorite.category as? NSArray
            newOrder.condition = favorite.condition
            newOrder.deposit = Int64(favorite.deposit)
            newOrder.imageLink = favorite.imageLink
            newOrder.isAddToFavorite = favorite.isAddToFavorite
            newOrder.itemDescription = favorite.description
            newOrder.itemLink = favorite.itemLink
            newOrder.price = favorite.price
            newOrder.price_photo = Int64(favorite.price_photo)
            newOrder.price_rent = Int64(favorite.price_rent)
            newOrder.size = favorite.size as? NSArray
            newOrder.title = favorite.title
            do {
                try viewContext.save()
                print("order saved")
                withAnimation(.linear(duration: 0.5)) {
                    presentAlert = true
                }
            } catch {
                print(error.localizedDescription)
            }
        }, label: {
            ZStack{
                Rectangle()
                Image(systemName: "cart")
                .foregroundColor(.white)
            }
            .frame(width: screen.width / 11, height: screen.width / 11, alignment: .center)
            .foregroundColor(.pink)
            .opacity(0.7)
            .cornerRadius(10.0)
            .alert("Платье добавлено в корзину", isPresented: $presentAlert) {
                Button("Отлично!") {}
            }
        })
        
    }
}

struct FavoriteAddToCartItem_Previews: PreviewProvider {
    static var favorite = AddToFavorites()
    static var previews: some View {
        NavigationView {
            FavoriteAddToCartItem(favorite: favorite, presentAlert: .constant(false))
        }
    }
}
