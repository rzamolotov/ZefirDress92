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
    @State var isLoading = false
    @State var selection: Set<String> = []
    @State private var error: ProductError?
    @State private var hasError = false
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    LazyVGrid(columns: gridLayout, spacing: columnSpacing) {
                        ForEach(productProvider.products) { product in
                            NavigationLink {
                                ItemDetailView(id: product.id, title: product.title, size: product.size, price_photo: product.price_photo, price_rent: product.price_rent ?? 0, deposit: product.deposit, description: product.description, link: product.link, image_link: product.image_link, availability: product.availability, price: product.price, condition: product.condition, isAddToFavorite: product.isAddToFavorite, category: product.category)
                            } label: {
                                ProductView(product: product)
                            }
                            
                        }
                    }
                    .navigationBarTitle("Все платья")
                    .padding([.trailing, .leading])
                    .refreshable {
                        await fetchProducts()
                        print(isLoading)
                    }
                    
                }
                TabViewRouter()
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
