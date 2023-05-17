//
//  ContentView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var productProvider: ProductProvider
    
    
    var body: some View {
        
        
        MainTabView()
            .transition(.move(edge: .trailing))
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewRouter())
            .environmentObject(ProductProvider())
    }
}
