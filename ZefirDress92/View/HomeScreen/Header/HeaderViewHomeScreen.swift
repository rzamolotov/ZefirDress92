//
//  HeaderViewHomeScreen.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.04.2023.
//

import SwiftUI

struct HeaderViewHomeScreen: View {
    @State var logoOffset = CGSize(width: 0, height: -50)
    
    var body: some View {
        HStack {
            Text("-Zefir Dress-")
                .foregroundColor(.pink)
                .opacity(0.7)
                .font(.largeTitle)
                .offset(logoOffset)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1)) {
                        logoOffset = CGSize(width: 0, height: 0)
                    }
                }
        }
    }
}


struct HeaderViewHomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HeaderViewHomeScreen()
    }
}
