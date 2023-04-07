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
    var title: String
    var category: [String]
    var size: [String]
    var product: Product
    
    init(title: String, category: [String], size: [String], isSet: Bool, presentAlert: Bool) {
        self._isSet = Binding.constant(isSet)
        self._presentAlert = Binding.constant(presentAlert)
        self.title = title
        self.category = category
        self.size = size
        self.product = Product(id: "", title: title, size: size, price_photo: 0, deposit: 0, description: "", link: "", image_link: "", availability: "", price: "", condition: "", isAddToFavorite: false, category: category)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Text(product.title)
                        .foregroundColor(buttonGray)
                        .font(.headline)
                }
                .padding(.bottom, 30)
                .padding(.top, 10)
                .padding(.leading, 10)
                Text(product.category[0])
                    .font(.callout)
                    .foregroundColor(buttonGray)
                    .fontWeight(.medium)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                Spacer()
                HStack{
                    VStack(alignment: .leading){
                        Text("Доступные размеры:")
                            .font(.caption)
                            .foregroundColor(buttonGray)
                            .fontWeight(.light)
                        HStack(spacing: 5) {
                            ForEach(product.size, id: \.self) { size in
                                ZStack{
                                    Rectangle()
                                        .frame(width: screen.width / 17, height: screen.width / 17, alignment: .center)
                                        .foregroundColor(.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.pink.opacity(0.7), lineWidth: 3)
                                        )
                                        .cornerRadius(10)
                                    
                                    Text(size)
                                        .font(.footnote)
                                        .foregroundColor(.pink)
                                        .opacity(0.7)
                                }
                            }
                        }
                    }//: Size
                    .padding(.bottom, 10)
                    .padding(.leading, 10)
                }
            } //:Vstack name/sizes
            Spacer()
            VStack(alignment: .trailing) {
                FavoriteAddToFavoriteItem(isSet: $isSet, product: product)
                    .padding(.top, 10)
                    .padding(.bottom, 30)
                    .padding(.trailing, 20)
                Spacer()
                FavoriteAddToCartItem(product: product, presentAlert: $presentAlert)
                    .padding(.bottom, 10)
                    .padding(.trailing, 20)
            } //: VStach favorite button/cart button
        }
        .frame(width: screen.width / 1.1 / 3 * 2, height: screen.height / 5)
    }
}


//struct FavoriteTitleTextView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesGrid(presentAlert: .constant(false), product: Product.example)
//            .environmentObject(ProductProvider())
//    }
//}
