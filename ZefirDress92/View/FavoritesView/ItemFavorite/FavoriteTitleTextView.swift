//
//  FavoriteTitleTextView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 30.03.2023.
//

import SwiftUI

struct FavoriteTitleTextView: View {
    @Binding var isSet: Bool
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var presentAlert: Bool
    var favorite: AddToFavorites
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Text(favorite.title ?? "")
                        .foregroundColor(buttonGray)
                        .font(.headline)
                }
                .padding(.bottom, 30)
                .padding(.top, 10)
                .padding(.leading, 10)
                Text("\(favorite.category ?? "Вечернее платье" as NSObject)")
                    .font(.callout)
                    .foregroundColor(buttonGray)
                    .fontWeight(.medium)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                Spacer()
                HStack{
//                    VStack(alignment: .leading){
//                        Text("Доступные размеры:")
//                            .font(.caption)
//                            .foregroundColor(buttonGray)
//                            .fontWeight(.light)
//                        HStack(spacing: 5) {
//                            ForEach(favorite.size, id: \.self) { size in
//                                ZStack{
//                                    Rectangle()
//                                        .frame(width: screen.width / 17, height: screen.width / 17, alignment: .center)
//                                        .foregroundColor(.white)
//                                        .overlay(
//                                            RoundedRectangle(cornerRadius: 10)
//                                                .stroke(.pink.opacity(0.7), lineWidth: 3)
//                                        )
//                                        .cornerRadius(10)
                                    
//                                    Text(size)
//                                        .font(.footnote)
//                                        .foregroundColor(.pink)
//                                        .opacity(0.7)
//                                }
//                            }
//                        }
//                    }//: Size
//                    .padding(.bottom, 10)
//                    .padding(.leading, 10)
                }
            } //:Vstack name/sizes
            Spacer()
            VStack(alignment: .trailing) {
                FavoriteAddToCartItem(favorite: favorite, presentAlert: $isSet)
                    .padding(.top, 10)
                    .padding(.bottom, 30)
                    .padding(.trailing, 20)
                Spacer()
                FavoriteAddToCartItem(favorite: favorite, presentAlert: $presentAlert)
                    .padding(.bottom, 10)
                    .padding(.trailing, 20)
            } //: VStach favorite button/cart button
        }
        .frame(width: screen.width / 1.1 / 3 * 2, height: screen.height / 5)
    }
}


struct FavoriteTitleTextView_Previews: PreviewProvider {
    static var favorite = AddToFavorites()
    static var previews: some View {
        FavoritesGrid(isSet: true, presentAlert: false, favorite: favorite)
 
    }
}
