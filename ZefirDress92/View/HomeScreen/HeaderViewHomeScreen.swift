//
//  HeaderViewHomeScreen.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.04.2023.
//

import SwiftUI

struct HeaderViewHomeScreen: View {
    
    var body: some View {
        HStack {
            Text("-Zefir Dress-")
                .foregroundColor(colorBrightPink)
                .font(.custom(boldFont, size: fontSizeLarge))
                
        }
        .frame(height: 25)
    }
}

struct HeaderViewHomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HeaderViewHomeScreen()
    }
}
