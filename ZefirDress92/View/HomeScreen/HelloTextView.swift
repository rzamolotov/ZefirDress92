//
//  HelloTextView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 19.04.2023.
//

import SwiftUI

struct HelloTextView: View {
    var body: some View {
        HStack {
            Text("Привет, Красотка! В этом разделе ты можешь посмотреть все платья, которые мы можем предоставить тебе на доставку, выбери понравившееся, добавь его в корзину и закажи доставку, либо воспользуйся нашим поиском, там ты сможешь осортировать платья по категориям, размерам или цвету и выбрать понравившееся.")
                .font(.custom(mediumFont, size: fontSizeMedium))
                .frame(width: screen.width / 1.05)
                .opacity(0.7)
        }
    }
}

struct HelloTextView_Previews: PreviewProvider {
    static var previews: some View {
        HelloTextView()
    }
}
