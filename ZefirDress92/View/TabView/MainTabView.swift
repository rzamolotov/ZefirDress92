//
//  MainTabView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.04.2023.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedIndex: Int = 0
    @State var addToCartAllert: Bool = false
    @State var addToFavorite: Bool = false
    @EnvironmentObject var productProvider: ProductProvider
    enum TabType: Int, CaseIterable {
        case home = 0
        case favorite
        case cart
        case search
        case peron
        
        var tabItem: TabItemData {
            switch self {
            case .home:
                return TabItemData(image: "house", selectedImage: "house.fill", title: "Главная")
            case .search:
                return TabItemData(image: "magnifyingglass.circle", selectedImage: "magnifyingglass.circle.fill", title: "Поиск")
            case .favorite:
                return TabItemData(image: "heart", selectedImage: "heart.fill", title: "Отложить")
            case .cart:
                return TabItemData(image: "cart", selectedImage: "cart.fill", title: "Корзина")
            case .peron:
                return TabItemData(image: "person", selectedImage: "person.fill", title: "О нас")
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
            case .search:
                SearchView(products: productProvider.products)
            case .favorite:
                FavoritesGridView(presentAlert: addToCartAllert, isSet: addToFavorite)
            case .cart:
                CartView()
            case .peron:
                AccountSheet(user_name: .constant(""), user_phone_number: .constant(""), user_email: .constant(""), user_address: .constant(""))
            }
        }
    }

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(addToCartAllert: false, addToFavorite: false)
            .environmentObject(ProductProvider())
    }
}
