//
//  EmptyPlaceholder.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 02.05.2023.
//

import SwiftUI

struct EmptyPlaceholder: View {
    var body: some View {
        VStack{
            Image("Olivia")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom, 75)
                .padding(.top, 25)
            Text("-Zefir Dess-")
                .foregroundColor(colorBrightPink)
                .padding(.bottom)
                .font(.custom(boldFont, size: fontSizeLarge))
            Text("Тут пока ничего нет")
                .foregroundColor(colorBrightPink)
                .font(.custom(mediumFont, size: fontSizeMedium))
                .padding([.leading, .trailing])
        }
    }
}

struct EmptyCartView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyPlaceholder()
    }
}
