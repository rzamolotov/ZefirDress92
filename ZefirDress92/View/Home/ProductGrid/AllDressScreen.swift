//
//  HomeScreen.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 01.03.2023.
//

import SwiftUI

struct AllDressScreen: View {
    
    @EnvironmentObject var shop: Shop
    @State var showOrderView = false
    var products: [Product]
    
    var body: some View {
        NavigationView{
            
            ProductGridView(products: products)
            
            //MARK: - Header
                .navigationBarTitle("Все платья")
        }//MARK: - Header
    }
}

struct AllDressScreen_Previews: PreviewProvider {
    static var products = ModelData().products
    static var previews: some View {
        AllDressScreen(products: products)
            .environmentObject(Shop())
    }
}
