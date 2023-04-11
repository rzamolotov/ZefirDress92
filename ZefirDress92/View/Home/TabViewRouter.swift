//
//  TabView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.03.2023.
//

import SwiftUI

struct TabViewRouter: View {
    @State private var selectedTab = 1 //for programmatic switching
    @EnvironmentObject var productProvider: ProductProvider
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: DressOrder.entity(), sortDescriptors: [])
    var orders: FetchedResults<DressOrder>
    @State var isSet: Bool = false
    @State var presentAlert: Bool = false
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: screen.width / 1.01, height: screen.height / 12)
                .foregroundColor(.pink)
                .opacity(0.1)
                .cornerRadius(30)
            HStack{
                NavigationLink {
                    ProductGridView(products: productProvider.products)
                    
                } label: {
                    VStack{
                        Image(systemName: "house")
                        Text("Все платья")
                    }
                }
                NavigationLink {
                    SizeList(products: productProvider.products)
                    
                } label: {
                    VStack{
                        Image(systemName: "house")
                        Text("Размеры")
                    }
                }
                NavigationLink {
                    SizeList(products: productProvider.products)
                    
                } label: {
                    VStack{
                        Image(systemName: "heart")
                        Text("Избранное")
                    }
                }
                NavigationLink {
                    CartView()
                    
                } label: {
                    VStack{
                        Image(systemName: "cart")
                        
                        Text("Корзина")
                    }
                }
            }
            
        }
        
//        TabView (selection: $selectedTab) {
//            ProductGridView(products: productProvider.products)
//                .tabItem {
//                    Image(systemName: "house")
//                    Text("Все платья")
//                }
//                .tag(0)
//            //            CategoryList(products: modelData.products)
//            //                .tabItem {
//            //                    Image(systemName: "plus")
//            //                    Text("Категории")
//            //                }
//            //                .tag(1)
//            SizeList(products: productProvider.products)
//                .tabItem {
//                    Image(systemName: "heart")
//                    Text("Размеры")
//                }
//                .tag(3)
//            FavoritesGridView(presentAlert: presentAlert, isSet: isSet)
//                .tabItem {
//                    Image(systemName: "heart")
//                    Text("Избранное")
//                }
//
//            CartView()
//                .badge(orders.count)
//                .tabItem {
//                    Image(systemName: "cart")
//                    Text("Корзина")
//                }
//                .tag(2)
//        }
//        .font(.headline)
    }
}

struct TabViewRouter_Previews: PreviewProvider {
    static var previews: some View {
        TabViewRouter()
            .environmentObject(ProductProvider())
    }
}
