//
//  ContentView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var shop: Shop
    var body: some View {
        HomeScreen(numberOfProducts: shop.products.count)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}
