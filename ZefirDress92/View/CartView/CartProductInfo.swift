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
            Image(order.imageName ?? "Olivia")
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(order.productName ?? "Красивое платье")
                    .font(.headline)
                HStack {
                    Text("price: \(order.price)")
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
