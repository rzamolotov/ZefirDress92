//
//  CartProductInfo.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import SwiftUI

struct CartProductInfo: View {
    var order: DressOrder
    
    var body: some View {
        Group {
            AsyncImage(url: URL(string: order.imageName ?? "")) { image in
                image
                    .resizable()
                    .frame(width: screen.width / 6, height: screen.height / 10)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(order.productName ?? "Красивое платье")
                    .font(.headline)
                HStack {
                    Text("price: \(order.price_photo)")
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
