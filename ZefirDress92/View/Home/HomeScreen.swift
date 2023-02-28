//
//  HomeScreen.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 01.03.2023.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var shop: Shop
    @State var showOrderView = false
    @State var showSearchView = false
    var numberOfProducts: Int
    
    var body: some View {
        NavigationView{
            
            ProductGridView()
            
            //MARK: - Header
                .navigationBarTitle("ZefirDress")
                .navigationBarItems(
                    leading: Button(action: {
                        showSearchView.toggle()
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                    }), trailing: Button(action: {
                        showOrderView.toggle()
                    }, label: {
                        ZStack{
                            Image(systemName: "cart")
                                .foregroundColor(.black)
                            if numberOfProducts > 0 {
                                Text("\(numberOfProducts)")
                                    .font(.caption2).bold()
                                    .foregroundColor(.white)
                                    .frame(width: 15, height: 15)
                                    .background(colorOrange)
                                    .cornerRadius(60)
                                    .offset(x: 13, y: -10)
                            }
                        }
                        
                    })
                )
                .sheet(isPresented: $showOrderView) {
                    NavigationView {
                        CartView()
                            .environmentObject(shop)
                    }
                }
                .sheet(isPresented: $showSearchView, content: {
                    NavigationView {
                        FilterView()
                        
                    }
                }) //MARK: - Header
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(numberOfProducts: 1)
            .environmentObject(Shop())
    }
}
