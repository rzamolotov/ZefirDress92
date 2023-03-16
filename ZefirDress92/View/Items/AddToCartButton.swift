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
            newOrder.imageName = product.image[0]
            newOrder.productName = product.name
            newOrder.id = product.id
            newOrder.price = Int16(product.price_rent)
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
                    Text("Добавить в корзину \(product.name)")
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

struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddToCartButton(product: Product.example, presentAlert: .constant(false))
        }
    }
}
