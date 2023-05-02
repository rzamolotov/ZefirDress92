//
//  ItemSizeCheckView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 07.03.2023.
//

import SwiftUI

struct ItemSizeCheckView: View {
    
    var product: Product
    
    var body: some View {
        HStack {
            Text(product.size.count > 1 ? "Подойдет для размеров" : "Подойдет для размера")
                .font(.custom(mediumFont, size: fontSizeMedium))
                .foregroundColor(colorFont)
            Spacer()
            ForEach(product.size, id: \.self) { sizes in
                Button {
                    //TODO: Сделать переходы на размеры по нажатию размера
                } label: {
                    Text("\(sizes)")
                        .font(.custom(boldFont, size: fontSizeMedium))
                        .foregroundColor(colorBrightPink)
                        .frame(width: screen.height / 22, height: screen.height / 22, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 5).stroke(colorBrightPink, lineWidth:1))
                }
            }
        }
    }
}

struct ItemSizeCheckView_Previews: PreviewProvider {
    static var previews: some View {
        ItemSizeCheckView(product: example)
    }
}

