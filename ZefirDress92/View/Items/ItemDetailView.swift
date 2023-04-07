//
//  ItemDetailView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI
import Kingfisher

struct ItemDetailView: View {
    
    var product: Product
    let itemID: String
    
    init(itemID: String) {
        self.itemID = itemID
        self.product = Product(
            id: itemID,
            title: "Платье Amabel",
            size: ["44", "46"],
            price_photo: 1500,
            price_rent: 2500,
            deposit: 1000,
            description: "Белое платье, состоящее из юбки с 3х метровым шлейфом и двумя вариантами топов ('американка' и вариант с рукавами).",
            link: "https://zefirdress.ru/vseplatya/accessuars",
            image_link: "http://shop-cdn1.vigbo.tech/shops/195624/products/21750271/images/preview-54001b28d11190b216a1f972ba2e5c91.JPG",
            availability: "in_stock",
            price: "1500 RUB",
            condition: "new",
            isAddToFavorite: true,
            category: ["Детское"]
        )
    }
    
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
