//
//  ItemDetailView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI
import Kingfisher

struct ItemDetailView: View {
    @StateObject var realmManager = RealmManager()
    var product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                
                KFImage(URL(string: product.image_link))
                    .resizable()
                    .shadow(radius: 5)
                    .frame(width: screen.width, height: screen.height / 1.8)
                    
                ItemDescriptionView(product: product)
            }
        }
        .navigationBarTitle(
            Text(product.title),
            displayMode: .automatic)
    }
}

//struct ItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ItemDetailView(product: Product.example)
//        }
//    }
//}
