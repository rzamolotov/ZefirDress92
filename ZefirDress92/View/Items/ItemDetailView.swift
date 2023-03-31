//
//  ItemDetailView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct ItemDetailView: View {
    
    var product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                
                AsyncImage(url: URL(string: product.image_link)) { image in
                    image
                        .resizable()
                        .shadow(radius: 5)
                        .frame(width: screen.width, height: screen.height / 1.8)
                } placeholder: {
                    ProgressView()
                }
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
