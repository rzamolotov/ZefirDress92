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
        
        let imageLinkArray = favorite.imageLink as? Array<String> ?? []
        KFImage(URL(string: imageLinkArray[0]))
            .placeholder({ progress in
                ProgressView()
            })
            .resizable()
            .scaledToFill()
            .cornerRadius(10)
            .frame(width: screen.width / 3, height: screen.height / 4)
    }
}

struct FavoriteImageView_Previews: PreviewProvider {
    static var favorite = AddToFavorites()
    static var previews: some View {
        FavoriteImageView(favorite: favorite)
    }
}
