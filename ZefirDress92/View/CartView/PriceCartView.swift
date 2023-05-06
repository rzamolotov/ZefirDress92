//
//  PriceCartView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import SwiftUI

struct PriceCartView: View {
    var order: DressOrder
    
    var body: some View {
        Text("аренда от \(order.price_photo) руб.")
            .foregroundColor(colorFont)
            .font(.custom(lightFont, size: fontSizeSmall))
    }
}


struct PriceCartView_Previews: PreviewProvider {
    static var order = DressOrder()
    static var previews: some View {
        PriceCartView(order: order)
    }
}
