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
        case favorite
        case cart
        case search
        
        var tabItem: TabItemData {
            switch self {
            case .home:
                return TabItemData(image: "house", selectedImage: "house.fill", title: "Главная")
            case .search:
                return TabItemData(image: "magnifyingglass", selectedImage: "magnifyingglass.circle.fill", title: "Поиск")
            case .favorite:
                return TabItemData(image: "heart", selectedImage: "heart.fill", title: "Избранное")
            case .cart:
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
            case .favorite:
                FavoritesGridView(presentAlert: false, isSet: true)
            case .cart:
                CartView()
            case .search:
                PickerListTests(products: productProvider.products)
            }
        }
    }

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(ProductProvider())
    }
}
