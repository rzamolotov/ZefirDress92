//
//  ItemGridView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 19.04.2023.
//

import SwiftUI

struct ItemGridView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var productProvider: ProductProvider
    var products: [Product]
    @State var selection: Set<String> = []
    @State private var error: ProductError?
    @State private var hasError = false
    @State private var currentPage = 1
    @Environment(\.refresh) private var refresh
    
    var body: some View {
        VStack{
            if productProvider.isLoading {
                ProgressView()
            }
            ScrollView{
                LazyVGrid(columns: gridLayout, spacing: columnSpacing) {
                    ForEach(productProvider.products, id: \.self) { product in
                        NavigationLink {
                            ItemDetailView(id: product.id,
                                           title: product.title,
                                           size: product.size,
                                           price_photo: product.price_photo,
                                           price_rent: product.price_rent ?? 0,
                                           deposit: product.deposit,
                                           description: product.description,
                                           link: product.link,
                                           image_link: product.image_link ?? ["https://i.ibb.co/wyBwfHG/IMG-7167.jpg"],
                                           availability: product.availability,
                                           price: product.price,
                                           condition: product.condition,
                                           isAddToFavorite: product.isAddToFavorite,
                                           category: product.category)
                        } label: {
                            ItemView(product: product)
                        }
                        
                    }
                }
                
                
            }
        }
        .alert(isPresented: $hasError, content: {
            Alert(title: Text("Ошибка сети"),
                  message: Text("Пожалуйста проверьте сетевое подключение и повторите снова"),
                  primaryButton: .default(Text("Обновить")) {
                Task {
                    await fetchProducts()
                }
            },
                  secondaryButton: .destructive(Text("Выйти")))
        })
        .onAppear {
            Task {
                await fetchProducts()
            }
        }
        
    }
   
}

extension ItemGridView {
    func fetchProducts() async {
        productProvider.isLoading = true
        do {
            try await  productProvider.fetchProducts()
        } catch {
            self.error = error as? ProductError ?? .unexpectedError(error: error)
            self.hasError = true
        }
        productProvider.isLoading = false
    }
}

struct ItemGridView_Previews: PreviewProvider {
    static var products = ProductProvider().products
    
    static var previews: some View {
        ItemGridView(products: products)
            .environmentObject(ViewRouter())
            .environmentObject(ProductProvider(network: Network()))
    }
}
