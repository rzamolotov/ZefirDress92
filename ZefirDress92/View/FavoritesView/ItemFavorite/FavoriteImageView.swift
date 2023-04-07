//
//  FavoriteImageView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 30.03.2023.
//

import SwiftUI

struct FavoriteImageView: View {
    var product: Product
    var image_link: String
    
    init(image_link: String) {
        self.image_link = image_link
        self.product = Product(id: "", title: "", size: [""], price_photo: 0, deposit: 0, description: "", link: "", image_link: image_link, availability: "", price: "", condition: "", isAddToFavorite: false, category: [""])
    }
    
    var body: some View {
        AsyncImage(url: URL(string: product.image_link)) { image in
            image
                .resizable()
                .frame(width: screen.width / 1.1 / 3, height: screen.height / 5)
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
    }
}

//struct FavoriteImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteImageView(product: Product.example)
//    }
//}
