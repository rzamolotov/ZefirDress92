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
    @EnvironmentObject var network: Network
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: DressOrder.entity(), sortDescriptors: [])
    var orders: FetchedResults<DressOrder>
    
    var body: some View {
        TabView (selection: $selectedTab) {
            ProductGridView(products: modelData.products)
                .tabItem {
                    Image(systemName: "house")
                    Text("Все платья")
                }
                .tag(0)
//            CategoryList(products: modelData.products)
//                .tabItem {
//                    Image(systemName: "plus")
//                    Text("Категории")
//                }
//                .tag(1)
            SizeList(products: network.dataProduct)
                .tabItem {
                    Image(systemName: "heart")
                    Text("Размеры")
                }
                .tag(3)
            FavoritesGridView(products: modelData.products)
                .tabItem {
                    Image(systemName: "heart")
                    Text("Избранное")
                }
            
            CartView()
                .badge(orders.count)
                .tabItem {
                    Image(systemName: "cart")
                    Text("Корзина")
                }
                .tag(2)
        }
        .font(.headline)
    }
}

struct TabViewRouter_Previews: PreviewProvider {
    static var previews: some View {
        TabViewRouter()
            .environmentObject(ModelData())
            .environmentObject(Network())
    }
}
