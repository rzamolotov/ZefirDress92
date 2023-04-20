//
//  AddToCartButton.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 27.02.2023.
//

import SwiftUI
import CoreData

struct AddToCartButton: View {
    @Environment(\.managedObjectContext) private var viewContext
    var product: Product
    @Binding var presentAlert: Bool
    
    var body: some View {
        Button(action: {
            let fetchRequest: NSFetchRequest<DressOrder> = DressOrder.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", product.id)
            do {
                let results = try viewContext.fetch(fetchRequest)
                if results.isEmpty {
                    // объекта с таким идентификатором еще нет в базе данных, сохраняем новый объект
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
                    try viewContext.save()
                    print("order saved")
                    //TODO: - сделать алерт с уведомлением, что товар добавлен в корзину
                    withAnimation(.linear(duration: 0.5)) {
                        presentAlert = true
                    }
                } else {
                    // TODO: - сделать алерт с уведомлением, что такой заказ уже есть бъект с таким идентификатором уже есть в базе данных, не сохраняем новый объект
                    print("order already exists")
                }
            } catch {
                // TODO: - сделать алерт с уведомлением об ошибке добавление в корщину
                print(error.localizedDescription)
            }
        }, label: {
            ZStack{
                Rectangle()
                HStack {
                    Image(systemName: "cart")
                        .font(.title)
                    Text("Добавить в корзину\n\(product.title)")
                        .font(.custom(boldFont, size: 16))
                }
                .font(.custom(boldFont, size: 16))
                .foregroundColor(.white)
            }
            .frame(width: screen.width / 1.1, height: screen.height / 12)
            .foregroundColor(.pink)
            .opacity(0.7)
            .cornerRadius(10)
        })
    }
}

struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddToCartButton(product: example, presentAlert: .constant(false))
        }
    }
}
