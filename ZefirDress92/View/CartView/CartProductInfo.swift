//
//  CartProductInfo.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import SwiftUI
import Kingfisher

struct CartProductInfo: View {
    var order: DressOrder
    
    var body: some View {
        HStack{
            CartImageView(order: order)
            
            VStack(alignment: .leading) {
                Text(order.title ?? "Красивое платье")
                    .font(.custom(boldFont, size: fontSizeMedium))
                    .foregroundColor(colorFont)
                    .padding(.top)
                Spacer()
                Text("аренда от **\(order.price_photo)** руб.")
                    .foregroundColor(colorFont)
                    .font(.custom(lightFont, size: fontSizeMedium))
                    .padding(.bottom)
            }
        }
    }
}


struct CartProductInfo_Previews: PreviewProvider {
    static var order = DressOrder()
    static var previews: some View {
        CartProductInfo(order: order)
    }
}
