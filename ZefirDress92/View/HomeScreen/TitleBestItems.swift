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
                .font(.custom(boldFont, size: 35))
                .foregroundColor(.black)
                .opacity(0.9)
            Spacer()
        }
    }
}

struct TitleBestItems_Previews: PreviewProvider {
    static var previews: some View {
        TitleBestItems()
    }
}
