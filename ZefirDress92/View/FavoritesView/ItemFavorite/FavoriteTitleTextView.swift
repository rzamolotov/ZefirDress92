//
//  FavoriteTitleTextView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 30.03.2023.
//

import SwiftUI


struct FavoriteTitleTextView: View {
    
    var favorite: AddToFavorites
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Text(favorite.title ?? "Платье Оливия")
                        .font(.custom(boldFont, size: fontSizeMedium))
                        .foregroundColor(colorFont)
                }
                .padding(.top)
                
                Spacer()
                HStack{
                    VStack(alignment: .leading){
                        Text("Доступные размеры:")
                            .font(.custom(boldFont, size: fontSizeMedium))
                            .foregroundColor(colorFont)
                            .fontWeight(.light)
                        HStack(spacing: 5) {
                            if favorite.size != nil {
                                ForEach(Array(favorite.size as? [String] ?? ["без размера"]), id: \.self) { size in
                                    Text(size)
                                        .font(.custom(boldFont, size: fontSizeMedium))
                                        .foregroundColor(colorBrightPink)
                                        .frame(width: screen.height / 22, height: screen.height / 22, alignment: .center)
                                        .background(RoundedRectangle(cornerRadius: 5).stroke(colorBrightPink, lineWidth:1))
                                }
                            }
                        }
                    }//: Size
                    .padding(.bottom)
                }
            } //:Vstack name/sizes
        }
        .frame(width: screen.width / 1.1 / 3 * 2, height: screen.height / 5)
    }
}


struct FavoriteTitleTextView_Previews: PreviewProvider {
    static var favorite = AddToFavorites()
    static var previews: some View {
        FavoriteTitleTextView(favorite: favorite)
    }
}
