//
//  TitleBestItems.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 19.04.2023.
//

import SwiftUI

struct TitleBestItems: View {
    var body: some View {
        HStack{
            Text("Наши платья")
                .font(.custom(boldFont, size: fontSizeLarge))
                .foregroundColor(colorFont)
            Spacer()
        }
    }
}

struct TitleBestItems_Previews: PreviewProvider {
    static var previews: some View {
        TitleBestItems()
    }
}
