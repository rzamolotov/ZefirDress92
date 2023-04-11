//
//  SizeItemView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.04.2023.
//

import SwiftUI
import Kingfisher

struct CategoryList: View {
    var product: Product
    @State private var zoomed = false
    
    var body: some View {
        HStack {
            KFImage(URL(string: product.image_link))
                .resizable()
                .scaleEffect(self.zoomed ? 2 : 1)
                .frame(width: screen.width / 4, height: screen.height / 10)
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.zoomed.toggle()
                    }
                }
                .scaledToFill()
            Text(product.category[0])
            
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList(product: example)
    }
}
