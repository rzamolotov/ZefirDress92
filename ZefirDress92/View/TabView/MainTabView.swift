//
//  MainTabView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.04.2023.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedIndex: Int = 0
    @EnvironmentObject var productProvider: ProductProvider
    enum TabType: Int, CaseIterable {
        case home = 0
        case myFile
        case profile
        
        var tabItem: TabItemData {
            switch self {
            case .home:
                return TabItemData(image: "house", selectedImage: "house.fill", title: "Главная")
            case .myFile:
                return TabItemData(image: "heart", selectedImage: "heart.fill", title: "Избранное")
            case .profile:
                return TabItemData(image: "cart", selectedImage: "cart.fill", title: "Корзина")
            }
        }
    }
        var body: some View {
            CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
                let type = TabType(rawValue: index) ?? .home
                getTabView(type: type)
            }
        }
        
        @ViewBuilder
        func getTabView(type: TabType) -> some View {
            switch type {
            case .home:
                ProductGridView(products: productProvider.products)
            case .myFile:
                FavoritesGridView(presentAlert: false, isSet: true)
            case .profile:
                CartView()
            }
        }
    }

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(ProductProvider())
    }
}
