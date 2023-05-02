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
                    .font(.headline)
                HStack {
                    Text("cтоимость аренды от: \(order.price_photo)руб.")
                }
                .font(.caption)
                .foregroundColor(.secondary)
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
