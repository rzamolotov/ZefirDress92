//
//  BrandLogo.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.03.2023.
//

import SwiftUI

struct BrandLogo: View {
    var body: some View {
        VStack{
            Image("Olivia")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom, 75)
            Text("-Zefir Dess-")
                .foregroundColor(.pink)
                .opacity(0.7)
                .font(.largeTitle)
            Text("прокат платьев")
                .foregroundColor(.pink)
                .opacity(0.5)
                .font(.subheadline)
            
        }
    }
}

struct BrandLogo_Previews: PreviewProvider {
    static var previews: some View {
        BrandLogo()
    }
}
