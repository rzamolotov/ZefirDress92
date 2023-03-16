//
//  HorizontalFilterItem.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 16.03.2023.
//

import SwiftUI

struct HorizontalFilterItem: View {
    let filteredSize: Product.Size
    @Binding var selectedSize: Product.Size
    
    var body: some View {
        
        VStack(spacing: 0.0) {
            Text("\(filteredSize.rawValue)")
                .font(.system(size: 12.0))
                .foregroundColor(selectedSize == filteredSize ? .black : .gray)
            if selectedSize == filteredSize {
                Rectangle()
                    .frame(height: 2.0)
                    .foregroundColor(.orange)
            }
        }
        .padding(.horizontal, 15)
    }
}

struct HorizontalFilterItem_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalFilterItem(filteredSize: .size42, selectedSize: .constant(.size42))
    }
}
