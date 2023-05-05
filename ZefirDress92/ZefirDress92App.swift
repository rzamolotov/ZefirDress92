//
//  ZefirDress92App.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

@main
struct ZefirDress92App: App {
    @StateObject var productProvider = ProductProvider()
    @StateObject var viewRouter = ViewRouter()
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(productProvider)
                .environmentObject(viewRouter)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                
        }
    }
}
