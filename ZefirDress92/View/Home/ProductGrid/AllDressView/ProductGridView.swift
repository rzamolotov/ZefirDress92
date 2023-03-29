//
//  ProductGridView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct ProductGridView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var products: [Product]
   
    var body: some View {
        
        NavigationView{
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: columnSpacing) {
                    ForEach(products) { product in
                        NavigationLink {
                            ItemDetailView(product: product)
                        } label: {
                            ProductView(product: product)
                        }
                        
                    }
                }
            }
//            .searchable(text: $searchQuery)
            .navigationBarTitle("Все платья")
            .padding([.trailing, .leading])
        }
    }
}



struct ProductGridView_Previews: PreviewProvider {
    static var products = ModelData().products
    
    static var previews: some View {
        ProductGridView(products: products)
            .environmentObject(ViewRouter())
    }
}
