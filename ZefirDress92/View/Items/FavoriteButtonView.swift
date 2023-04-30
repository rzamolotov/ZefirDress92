//
//  FavoriteButtonView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 12.03.2023.
//

import SwiftUI
import CoreData

struct FavoriteButtonView: View {
    
    @Binding var isSet: Bool
    @Environment(\.managedObjectContext) private var viewContext
    var product: Product
    
    var body: some View {
        Button {
            let fetchRequest: NSFetchRequest<AddToFavorites> = AddToFavorites.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", product.id)
            do {
                let results = try viewContext.fetch(fetchRequest)
                if let favorite = results.first {
                    // объект с таким идентификатором уже есть в базе данных, удаляем его
                    viewContext.delete(favorite)
                    try viewContext.save()
                    isSet = false
                    print("favorite deleted")
                } else {
                    // объекта с таким идентификатором нет в базе данных, добавляем новый объект
                    let newFavorite = AddToFavorites(context: viewContext)
                    newFavorite.id = product.id
                    newFavorite.availability = product.availability
                    newFavorite.category = product.category as NSArray
                    newFavorite.condition = product.condition
                    newFavorite.deposit = Int64(product.deposit)
                    newFavorite.imageLink = product.image_link as? NSArray
                    newFavorite.isAddToFavorite = product.isAddToFavorite
                    newFavorite.itemDescription = product.description
                    newFavorite.itemLink = product.link
                    newFavorite.price = product.price
                    newFavorite.price_photo = Int64(product.price_photo)
                    newFavorite.price_rent = Int64(product.price_rent ?? 0)
                    newFavorite.size = product.size as NSArray
                    newFavorite.title = product.title
                    try viewContext.save()
                    isSet = true
                    print("favorite saved")
                }
            } catch {
                print(error.localizedDescription)
            }
        } label: {
            Image(systemName: isSet ? "heart.fill" : "heart")
                .foregroundColor(.pink)
                .opacity(0.7)
                .frame(width: 28, height: 28, alignment: .center)
                .background(Color.white.cornerRadius(5))
                .background(RoundedRectangle(cornerRadius: 5).stroke(.pink, lineWidth:2))
        }
    }
}

struct FavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonView(isSet: .constant(false), product: example)
    }
}
