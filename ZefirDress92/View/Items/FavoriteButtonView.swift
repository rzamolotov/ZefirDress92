//
//  FavoriteButtonView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 12.03.2023.
//

import SwiftUI

struct FavoriteButtonView: View {
    @Binding var isSet: Bool
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        Button {
            isSet.toggle()
            
        } label: {
            Image(systemName: isSet ? "heart.fill" : "heart")
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
        FavoriteButtonView(isSet: .constant(false))
    }
}
