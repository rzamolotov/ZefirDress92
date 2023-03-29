////
////  ProductGrid+Search.swift
////  ZefirDress92
////
////  Created by Роман Замолотов on 17.03.2023.
////
//
//import SwiftUI
//
//struct ProductGrid_Search: View {
//    var product = Product()
//    
//    @Environment(\.isSearching) var isSearching
//    @Binding var searchQuery: String
//    @Binding var isSearchingSizes: Bool
// 
//    var filteredCategory: [Product.Category] {
//        if searchQuery.isEmpty {
//            return product.category
//        } else {
//            if isSearchingSizes {
//                let filteredRecipes = product.category.filter {
//                    !$0.ingredients.filter { ingredient in
//                        ingredient.emoji == searchQuery
//                    }.isEmpty
//                }
//                return filteredRecipes
//            } else {
//                return product.category.filter {
//                    $0.name.localizedCaseInsensitiveContains(searchQuery)
//                }
//            }
//        }
//    }
//    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct ProductGrid_Search_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductGrid_Search(product: Product.example)
//    }
//}
