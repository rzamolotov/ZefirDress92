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
            newOrder.imageName = product.image_link
            newOrder.productName = product.title
//            newOrder.id = product.id
            newOrder.price = Int16(product.price_photo)
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
