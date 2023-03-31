////
////  SizeGridView.swift
////  ZefirDress92
////
////  Created by Роман Замолотов on 29.03.2023.
////
//
//import SwiftUI
//
//struct SizeGridView: View {
//    var sizeName: String
//    var products: [Product]
//    
//    var body: some View {
//        ScrollView{
//            VStack(alignment: .leading) {
//                HStack{
//                    Text(sizeName)
//                        .font(.headline)
//                        .padding(.leading, 15)
//                        .padding(.top, 10)
//                }
//                LazyVGrid(columns: gridLayout, spacing: columnSpacing) {
//                    ForEach(products) { product in
//                        NavigationLink {
//                            ItemDetailView(product: product)
//                        } label: {
//                            ProductView(product: product)
//                        }
//                    }
//                    
//                }
//            }
//        }
//    }
//}
//
//struct SizeGridView_Previews: PreviewProvider {
//
//    
//    static var previews: some View {
//        SizeGridView(sizeName: "42 размер", products: Array(products.prefix(20)))
//    }
//}
