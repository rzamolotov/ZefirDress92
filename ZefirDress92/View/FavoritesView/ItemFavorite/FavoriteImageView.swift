//
//  FavoriteImageView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 30.03.2023.
//

import SwiftUI

struct FavoriteImageView: View {
    var product: Product
    
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
