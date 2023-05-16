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
            Text("У нас есть шикарные платья для тебя! Просмотри все модели, добавь понравившееся в корзину и закажи доставку. Или воспользуйся поиском, чтобы отсортировать платья по размерам и выбрать идеальное.")
                .foregroundColor(colorFont)
                .font(.custom(lightFont, size: fontSizeMedium))
                .frame(width: screen.width / 1.05)
        }
    }
}

struct HelloTextView_Previews: PreviewProvider {
    static var previews: some View {
        HelloTextView()
    }
}
