//
//  ItemDetailView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct ItemDetailView: View {
    
    var product: Product
    @State private var isShareSheetShowing = false
    @State var showOrderView = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                TabView {
                    ForEach(product.image, id: \.self) { images in
                        Image(images)
                            .resizable()
                            .scaledToFill()
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .shadow(radius: 5)
                .frame(width: screen.width, height: screen.height / 1.8)
                
                ItemDescriptionView(product: product)
            }
            .navigationBarTitle(
                Text(product.name),
                displayMode: .automatic)
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static let shop = Shop()
    static var previews: some View {
        NavigationView {
            ItemDetailView(product: Product.example)
        }
    }  
}
