//
//  FavoriteAddToFavoriteItem.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 30.03.2023.
//

import SwiftUI

struct FavoriteAddToFavoriteItem: View {
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Image(systemName: isSet ? "heart.fill" : "heart")
                .foregroundColor(.pink)
                .opacity(0.7)
                .frame(width: screen.width / 11, height: screen.width / 11, alignment: .center)
                .background(Color.white.cornerRadius(5))
                .background(RoundedRectangle(cornerRadius: 5).stroke(.pink, lineWidth:2))
        }
    }
}

struct FavoriteAddToFavoriteItem_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteAddToFavoriteItem(isSet: .constant(false))
    }
}
