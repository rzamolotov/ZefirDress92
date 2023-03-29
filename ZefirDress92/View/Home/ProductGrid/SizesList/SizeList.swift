//
//  SizeList.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 29.03.2023.
//

import SwiftUI

struct SizeList: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var network: Network
    var products: [Product]

    var body: some View {
        NavigationView {
            VStack {
                ForEach(network.sizes.keys.sorted(), id: \.self) { key in
                    SizesRow(sizeName: key, products: network.sizes[key]!)
                        .padding(.bottom, 15)
                        .padding(.top, 5)
                }
                .listRowInsets(EdgeInsets())
            }
            .onAppear{
                network.loadData()
            }
            .padding()
        }
    }
}

struct SizeList_Previews: PreviewProvider {
    
    static var products = Network().dataProduct
    
    static var previews: some View {
        SizeList(products: Array(products.prefix(10)))
            .environmentObject(ViewRouter())
            .environmentObject(Network())
    }
}
