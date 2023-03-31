//
//  ProductGridView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct ProductGridView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var productProvider: ProductProvider
    var products: [Product]
    
    @AppStorage("lastUpdated")var lastUpdated = Date.distantFuture.timeIntervalSince1970
    @State var editMode: EditMode = .inactive
    @State var isLoading = false
    @State var selection: Set<String> = []
    @State private var error: ProductError?
    @State private var hasError = false
    
    var body: some View {
        NavigationView{
//            ScrollView {
//                LazyVGrid(columns: gridLayout, spacing: columnSpacing) {
                    List(selection: $selection){
                    ForEach(productProvider.products) { product in
                        NavigationLink {
                            ItemDetailView(product: product)
                        } label: {
                            ProductView(product: product)
                        }
                        
                    }
                }
                
//            }
            .navigationBarTitle("Все платья")
            .padding([.trailing, .leading])
            .refreshable {
                await fetchProducts()
            }
    
        }
        .task {
            await fetchProducts()
        }
       
    }
      
}

extension ProductGridView {
    func fetchProducts() async {
        isLoading = true
        do {
            try await productProvider.fetchProducts()
        } catch {
            self.error = error as? ProductError ?? .unexpectedError(error: error)
            self.hasError = true
        }
        isLoading = false
    }
}



struct ProductGridView_Previews: PreviewProvider {
    static var products = ProductProvider().products
    
    static var previews: some View {
        ProductGridView(products: products)
            .environmentObject(ViewRouter())
            .environmentObject(ProductProvider(network: Network()))
    }
}
