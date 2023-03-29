////
////  FilterView.swift
////  ZefirDress92
////
////  Created by Роман Замолотов on 16.03.2023.
////
//
//import SwiftUI
//
//struct FilterView: View {
//    @Binding var selectedSize: Product.Size
//    var sizes: [Product.Size]
//    
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack {
//                ForEach(sizes, id: \.self) { size in
//                    HorizontalFilterItem(filteredSize: selectedSize, selectedSize: $selectedSize)
//                        .onTapGesture {
//                            selectedSize = size
//                        }
//                }
//            }
//        }
//    }
//}
//
//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView(selectedSize: .constant(.size42), sizes: Product.Size.allCases)
//    }
//}
