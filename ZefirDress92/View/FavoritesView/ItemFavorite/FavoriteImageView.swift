//
//  FavoriteImageView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 30.03.2023.
//

import SwiftUI
import Kingfisher

struct FavoriteImageView: View {
    var favorite: AddToFavorites
    
    var body: some View {
        KFImage(URL(string: (favorite.imageLink ?? "" as NSObject) as! String))
            .placeholder({ progress in
                ProgressView()
            })
            .resizable()
            .frame(width: screen.width / 1.1 / 3, height: screen.height / 5)
            .aspectRatio(contentMode: .fit)
    }
}

struct FavoriteImageView_Previews: PreviewProvider {
    static var favorite = AddToFavorites()
    static var previews: some View {
        FavoriteImageView(favorite: favorite)
    }
}
