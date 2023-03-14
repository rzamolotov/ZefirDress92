//
//  ZefirDress92App.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

@main
struct ZefirDress92App: App {
    @StateObject var modelData = ModelData()
    @StateObject var viewRouter = ViewRouter() //changes views e.g. login to home
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewRouter)
                .environmentObject(modelData)
        }
    }
}
