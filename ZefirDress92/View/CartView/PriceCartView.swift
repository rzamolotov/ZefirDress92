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
        Text("\(order.price)")
    }
}


struct PriceCartView_Previews: PreviewProvider {
    static var order = DressOrder()
    static var previews: some View {
        PriceCartView(order: order)
    }
}
