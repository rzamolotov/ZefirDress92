//
//  HomeScreenView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 19.04.2023.
//

import SwiftUI

struct HomeScreenView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var productProvider: ProductProvider
    
    var body: some View {
        NavigationView {
            VStack{
                HeaderViewHomeScreen()
                ScrollView{
                    HelloTextView()
                        .padding([.bottom])
                    TitleBestItems()
                    ItemGridView(products: productProvider.products)
                }
                .padding([.leading, .trailing])
            }
            .background(colorBackground)
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
            .environmentObject(ViewRouter())
            .environmentObject(ProductProvider())
    }
}
