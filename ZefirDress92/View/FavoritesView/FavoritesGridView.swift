//
//  FavoritesGridView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import SwiftUI
import CoreData

struct FavoritesGridView: View {
    
    @State var presentAlert: Bool
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var productProvider: ProductProvider
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: AddToFavorites.entity(), sortDescriptors: [])
    var favorites: FetchedResults<AddToFavorites>
    
    var body: some View {
        NavigationView{
            ScrollView {
                ForEach(favorites) { favorite in
                    NavigationLink {
                        ItemDetailView(id: favorite.id ?? "0", title: favorite.title ?? "Olivia", size: favorite.size as! [String], price_photo: Int(favorite.price_photo), price_rent: Int(favorite.price_rent), deposit: Int(favorite.deposit), description: favorite.itemDescription ?? "", link: favorite.itemLink ?? "", image_link: favorite.image_link ?? "", availability: favorite.availability!, price: favorite.price!, condition: favorite.condition ?? "", isAddToFavorite: favorite.isAddToFavorite, category: favorite.category as! [String])
                    } label: {
                        FavoritesGrid(isSet: false, presentAlert: presentAlert, favorite: favorite)
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        viewContext.delete(favorites[index])
                    }
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                if(favorites.count == 0) {
                    EmptyFavoritesView()
                }
            }
            .navigationTitle("Избранное")
        }
    }
}

struct FavoritesGridView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesGridView(presentAlert: false)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(ProductProvider())
    }
}
