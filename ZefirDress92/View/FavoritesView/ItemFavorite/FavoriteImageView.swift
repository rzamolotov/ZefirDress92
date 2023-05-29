//
//  FavoriteImageView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 30.03.2023.
//

import SwiftUI

struct FavoriteImageView: View {
    
    var favorite: AddToFavorites
    
    var body: some View {
        
        let imageLinkArray = favorite.imageLink as? Array<String> ?? []
        AsyncImage(url: URL(string: imageLinkArray[0])!, placeholder: { ProgressView()}, image:  { Image(uiImage: $0)
            .resizable() }
             )
            .aspectRatio(contentMode: .fill)
            .frame(width: screen.width / 2.5, height: screen.height / 4)
            .cornerRadius(10)
            .shadow(radius: 1)
            
    }
}

struct FavoriteImageView_Previews: PreviewProvider {
    static var favorite = AddToFavorites()
    static var previews: some View {
        FavoriteImageView(favorite: favorite)
    }
}
