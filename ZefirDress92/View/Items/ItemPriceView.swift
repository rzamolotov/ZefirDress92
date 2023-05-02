//
//  ItemPriceView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 08.03.2023.
//

import SwiftUI

struct ItemPriceView: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Фотосессия \(product.price_photo) руб.")
            }
            HStack {
                Text(product.price_rent == 0 ? "Платье не подходит для мероприятий" : "Мероприятие \(product.price_rent ?? 0) руб." )
            }
        }
        .foregroundColor(colorFont)
        .font(.custom(mediumFont, size: fontSizeSmall))
    }
}


struct ItemPriceView_Previews: PreviewProvider {
    static var previews: some View {
        ItemPriceView(product: example)
    }
}
