//
//  FavoritesGrid.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 30.03.2023.
//

import SwiftUI

struct FavoritesGrid: View {

    @State var isSet: Bool
    @State var presentAlert: Bool
    var favorite: AddToFavorites
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.1)
                .shadow(radius: 5)
            HStack{
                FavoriteImageView(favorite: favorite)
                FavoriteTitleTextView(isSet: $isSet, presentAlert: $presentAlert, favorite: favorite)
                
            }
        }
        .frame(width: screen.width / 1.1, height: screen.height / 5)
        .cornerRadius(10)
    }
}

struct FavoritesGrid_Previews: PreviewProvider {
    static var favorite = AddToFavorites()
    static var previews: some View {
        FavoritesGrid(isSet: false, presentAlert: false, favorite: favorite)
    }
}
