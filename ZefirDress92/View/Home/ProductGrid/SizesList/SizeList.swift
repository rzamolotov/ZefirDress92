//
//  SizeList.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 29.03.2023.
//

import SwiftUI

struct SizeList: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var productProvider: ProductProvider
    var products: [Product]
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(productProvider.sizes.keys.sorted(), id: \.self) { key in
                    SizesRow(sizeName: key, products: productProvider.sizes[key]!)
                        .padding(.bottom, 15)
                        .padding(.top, 5)
                }
                .listRowInsets(EdgeInsets())
            }
            .padding()
        }
    }
}

struct SizeList_Previews: PreviewProvider {
    
    static var products = ProductProvider().products
    
    static var previews: some View {
        SizeList(products: Array(products.prefix(10)))
            .environmentObject(ViewRouter())
            .environmentObject(ProductProvider())
    }
}
