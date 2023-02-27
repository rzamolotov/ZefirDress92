//
//  ZefirDress92App.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

@main
struct ZefirDress92App: App {
    
    var shop = Shop()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(shop)
        }
    }
}
