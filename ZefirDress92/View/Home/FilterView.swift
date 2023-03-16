//
//  FilterView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 16.03.2023.
//

import SwiftUI

struct FilterView: View {
    @Binding var slectedSize: Product.Size
    var sizes: [Product.Size]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(sizes, id: \.self) { size in
                    Text("\(size.rawValue)")
                }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(slectedSize: .constant(.size42), sizes: Product.Size.allCases)
    }
}
