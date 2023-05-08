//
//  FavoritesGridView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import SwiftUI
import CoreData

struct FavoritesGridView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var productProvider: ProductProvider
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: AddToFavorites.entity(), sortDescriptors: [])
    var favorites: FetchedResults<AddToFavorites>
    
    var body: some View {
        NavigationView{
            VStack {
                HeaderViewHomeScreen()
                    .padding([.leading, .trailing, .top])
                HStack{
                    Text("Избранные платья")
                        .font(.custom(boldFont, size: fontSizeMedium))
                }
                if favorites.count == 0 {
                    EmptyPlaceholder()
                }
                ScrollView {
                    ForEach(favorites) { favorite in
                        NavigationLink {
                            ItemDetailView(id: favorite.id ?? "0", title: favorite.title ?? "Olivia", size: favorite.size as! [String], price_photo: Int(favorite.price_photo), price_rent: Int(favorite.price_rent), deposit: Int(favorite.deposit), description: favorite.itemDescription ?? "", link: favorite.itemLink ?? "", image_link: favorite.imageLink as? [String] ?? ["https://i.ibb.co/236Vysn/2022-02-05-12-07-19.jpg"], availability: favorite.availability!, price: favorite.price!, condition: favorite.condition ?? "", isAddToFavorite: favorite.isAddToFavorite, category: favorite.category as! [String])
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(colorPink)
                                    .opacity(0.08)
                                    .shadow(radius: 10)
                                HStack{
                                    FavoriteImageView(favorite: favorite)
                                    FavoriteTitleTextView(favorite: favorite)
                                    
                                }
                            }
                            .frame(width: screen.width / 1.1, height: screen.height / 4)
                            .cornerRadius(10)
                        }
                    }
                   
                }
               
            }
        }
    }
}

struct FavoritesGridView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesGridView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(ProductProvider())
    }
}
