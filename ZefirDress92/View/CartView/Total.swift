//
//  Total.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 15.03.2023.
//

import SwiftUI

struct Total: View {
    var orders: FetchedResults<DressOrder>
    
    var body: some View {
        HStack {
            Text("Итого")
                .font(.headline)
            
            Spacer()
            
            Text(String(format: "%.0f", calcTotal(orders: orders)) + "рублей.")
                .font(.headline)
        }
        .padding(.leading)
        .padding(.trailing)
    }
    
    func calcTotal(orders: FetchedResults<DressOrder>) -> Double {
        var totalPrice = 0.00
        
        orders.forEach { order in
            let productPrice = order.price_photo
            totalPrice += Double(productPrice )
        }
        let roundedTotalPrice = round(totalPrice * 100)/100.0
        
        return roundedTotalPrice
    }
}
