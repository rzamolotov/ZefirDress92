//
//  ProductGridView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct ProductGridView: View {
    
    @EnvironmentObject var shop: Shop
    @State var showOrderView = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                    ForEach(products) { product in
                        NavigationLink(
                            destination: ItemDetailView(product: product)) {
                                ProductView(product: product)
                            }
                    }
                })
            }
            .navigationBarTitle("Наши платья")
            .navigationBarItems(
                trailing: Button(action: {
                    showOrderView.toggle()
                }, label: {
                    Image(systemName: "cart.fill")
                })
            )
            .sheet(isPresented: $showOrderView) {
                NavigationView {
                    CartView()
                        .environmentObject(shop)
                }
            }
        }
    }
}

struct ProductGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProductGridView()
    }
}
