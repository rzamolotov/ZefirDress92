//
//  TabView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.03.2023.
//

import SwiftUI

struct TabViewRouter: View {
    @State private var selectedTab = 1 //for programmatic switching
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var shop: Shop
    var product: Product
    
    var body: some View {
        TabView (selection: $selectedTab) {
            HomeScreen(numberOfProducts: shop.products.count)
                .tabItem {
                    Image(systemName: "house")
                    Text("Все платья")
                }
                .tag(0)
            CategoryList(product: product)
                .tabItem {
                    Image(systemName: "plus")
                    Text("Категории")
                }
                .tag(1)
            CartView()
                .tabItem {
                    ZStack{
                    Image(systemName: "cart")
                        if shop.products.count > 0 {
                            Text("\(shop.products.count)")
                                .font(.caption2).bold()
                                .foregroundColor(.white)
                                .frame(width: 15, height: 15)
                                .background(colorOrange)
                                .cornerRadius(60)
                                .offset(x: 13, y: -10)
                        }
                    }
                    Text("Корзина")
                }
                .tag(2)
        }
        .font(.headline)
    }
}

struct TabViewRouter_Previews: PreviewProvider {
    static var previews: some View {
        TabViewRouter(product: Product.example)
            .environmentObject(ModelData())
            .environmentObject(Shop())
    }
}
