//
//  FavoriteAddToCartItem.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 30.03.2023.
//

import SwiftUI

struct FavoriteAddToCartItem: View {
    @Environment(\.managedObjectContext) private var viewContext
    var product: Product
    @Binding var presentAlert: Bool
    
    var body: some View {
        Button(action: {
            let newOrder = DressOrder(context: viewContext)
            newOrder.id = product.id
            newOrder.availability = product.availability
            newOrder.category = product.category as NSObject
            newOrder.condition = product.condition
            newOrder.deposit = Int64(product.deposit)
            newOrder.image_link = product.image_link
            newOrder.isAddToFavorite = product.isAddToFavorite
            newOrder.itemDescription = product.description
            newOrder.itemLink = product.link
            newOrder.price = product.price
            newOrder.price_photo = Int64(product.price_photo)
            newOrder.price_rent = Int64(product.price_rent ?? 0)
            newOrder.size = product.size as NSObject
            newOrder.title = product.title
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
            .alert("Платье \(product.title) добавлено в корзину", isPresented: $presentAlert) {
                Button("Отлично!") {}
            }
        })
        
    }
}
//
//struct FavoriteAddToCartItem_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            FavoriteAddToCartItem(product: Product.example, presentAlert: .constant(false))
//        }
//    }
//}
