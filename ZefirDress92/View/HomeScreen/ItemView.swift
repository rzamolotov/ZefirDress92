//
//  ItemView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 19.04.2023.
//

import SwiftUI
import Kingfisher

struct ItemView: View {
    @EnvironmentObject var productProvider: ProductProvider
    var product: Product
    
    var body: some View {
        VStack (alignment: .leading) {
            KFImage(URL(string: product.image_link))
                .placeholder { progress in
                    ProgressView()
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screen.width / 2.5, height: screen.height / 4)
                .cornerRadius(10)
                .shadow(radius: 1)
            
            VStack(alignment: .leading, spacing: 2) {
                VStack(alignment: .leading){
                    Text(product.title)
                        .font(.custom(boldFont, size: 12))
                        .foregroundColor(.black)
                        .opacity(0.9)
                }
                Text("аренда от \(product.price_photo) руб.")
                    .font(.custom(lightFont, size: 12))
                    .foregroundColor(.black)
                    .opacity(0.9)
                HStack {
                    Text("Размеры")
                        .font(.custom(lightFont, size: 12))
                        .foregroundColor(.black)
                        .opacity(0.9)
                    ForEach(product.size, id: \.self) { sizes in
                        Text("\(sizes)")
                            .font(.custom(boldFont, size: 10))
                            .foregroundColor(.pink)
                            .opacity(0.7)
                    }
                }
            }
        }
        .frame(width: screen.width / 2.3, height: screen.height / 2.9)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(product: example)
    }
}
