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
    @ObservedObject var userDataVM = UserDataViewModel()

    enum TabType: Int, CaseIterable {
        case home = 0
        case favorite
        case cart
        case search
        case peron
        
        var tabItem: TabItemData {
            switch self {
            case .home:
                return TabItemData(image: "house", selectedImage: "house.fill", title: "Главная", isCart: false)
            case .search:
                return TabItemData(image: "magnifyingglass.circle", selectedImage: "magnifyingglass.circle.fill", title: "Поиск", isCart: false)
            case .favorite:
                return TabItemData(image: "heart", selectedImage: "heart.fill", title: "Избранное", isCart: false)
            case .cart:
                return TabItemData(image: "cart", selectedImage: "cart.fill", title: "Примерить", isCart: true)
            case .peron:
                return TabItemData(image: "person", selectedImage: "person.fill", title: "О нас", isCart: false)
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
            HomeScreenView()
        case .search:
            SearchView(products: productProvider.products)
        case .favorite:
            FavoritesGridView()
        case .cart:
            CartView(orderVM: OrderViewModel(userDataVM: userDataVM))
        case .peron:
            AccountSheet()
        }
    }
    
    
    struct MainTabView_Previews: PreviewProvider {
        static var previews: some View {
            MainTabView()
                .environmentObject(ProductProvider())
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
