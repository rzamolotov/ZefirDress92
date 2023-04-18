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
        Group {
            KFImage(URL(string: order.image_link ?? ""))
                .placeholder({ progress in
                    ProgressView()
                })
                .resizable()
                .frame(width: screen.width / 6, height: screen.height / 10)
        }
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


struct CartProductInfo_Previews: PreviewProvider {
    static var order = DressOrder()
    static var previews: some View {
        CartProductInfo(order: order)
    }
}
