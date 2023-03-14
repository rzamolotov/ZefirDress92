//
//  FavoriteButtonView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 12.03.2023.
//

import SwiftUI

struct FavoriteButtonView: View {
    @Binding var isAddToFavorite: Bool
    
    var body: some View {
        Button {
            isAddToFavorite.toggle()
        } label: {
            Image(systemName: isAddToFavorite ? "heart.fill" : "heart")
                .foregroundColor(.pink)
                .opacity(0.7)
                .frame(width: 28, height: 28, alignment: .center)
                .background(Color.white.cornerRadius(5))
                .background(RoundedRectangle(cornerRadius: 5).stroke(.pink, lineWidth:2))
        }
    }
}

struct FavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonView(isAddToFavorite: .constant(true))
    }
}
