//
//  AddToCartButton.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 27.02.2023.
//

import SwiftUI

struct AddToCartButton: View {
    @Environment(\.managedObjectContext) private var viewContext
    var product: Product
    @Binding var presentAlert: Bool
    
    var body: some View {
        Button(action: {
            //TODO: ADD TO CART
            let newOrder = DressOrder(context: viewContext)
            newOrder.id = product.id
            newOrder.availability = product.availability
            newOrder.category = product.category as NSArray
            newOrder.condition = product.condition
            newOrder.deposit = Int64(product.deposit)
            newOrder.image_link = product.image_link
            newOrder.isAddToFavorite = product.isAddToFavorite
            newOrder.itemDescription = product.description
            newOrder.itemLink = product.link
            newOrder.price = product.price
            newOrder.price_photo = Int64(product.price_photo)
            newOrder.price_rent = Int64(product.price_rent ?? 0)
            newOrder.size = product.size as NSArray
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
                HStack{
                    Image(systemName: "cart")
                        .font(.title)
                    Text("Добавить в корзину \(product.title)")
                }
                .foregroundColor(.white)
            }
            .frame(width: screen.width / 1.1, height: 60)
            .foregroundColor(.pink)
            .opacity(0.7)
            .cornerRadius(15.0)
        })
    }
}

//struct AddToCartButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            AddToCartButton(product: Product.example, presentAlert: .constant(false))
//        }
//    }
//}
