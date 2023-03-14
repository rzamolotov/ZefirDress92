//
//  ContentView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
        switch viewRouter.currentPage {
        case .login:
            LoginView()
        case .landing:
            TabViewRouter()
                .transition(.move(edge: .trailing))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewRouter())
    }
}
