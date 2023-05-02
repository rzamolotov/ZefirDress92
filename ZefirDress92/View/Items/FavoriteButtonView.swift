//
//  FavoriteButtonView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 12.03.2023.
//

import SwiftUI
import CoreData

struct FavoriteButtonView: View {
    
    @EnvironmentObject var favoriteButtonVM: FavoriteButtonViewModel
       
       var body: some View {
           Button {
               favoriteButtonVM.toggleIsAddToFavorite()
           } label: {
               Image(systemName: favoriteButtonVM.isAddToFavorite ? "heart.fill" : "heart")
                   .foregroundColor(colorBrightPink)
                .frame(width: screen.height / 22, height: screen.height / 22, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 5).stroke(colorBrightPink, lineWidth:1))
        }
    }
}


struct FavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonView()
            .environmentObject(FavoriteButtonViewModel())
    }
}
