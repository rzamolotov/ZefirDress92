////
////  ItemsToShowFilter.swift
////  ZefirDress92
////
////  Created by Роман Замолотов on 16.03.2023.
////
//
//import SwiftUI
//
//struct ItemsToShowFilter: View {
//    
//    let sections: [Product.Size] = Product.Size.allCases
//    @State var selected: Product.Size = .size42
//    
//    var body: some View {
//        VStack() {
//            FilterView(selectedSize: $selected, sizes: sections)
//            switch selected {
//            case .size38:
//                ForEach(sections, id: \.self) { product in
//                    Text("\(product.rawValue)")
//                }
//            case .size40:
//                ForEach(sections, id: \.self) { product in
//                    Text("\(product.rawValue)")
//                }
//            case .size42:
//                ForEach(sections, id: \.self) { product in
//                    Text("\(product.rawValue)")
//                }
//            case .size44:
//                ForEach(sections, id: \.self) { product in
//                    Text("\(product.rawValue)")
//                }
//            case .size46:
//                ForEach(sections, id: \.self) { product in
//                    Text("\(product.rawValue)")
//                }
//            case .size48:
//                ForEach(sections, id: \.self) { product in
//                    Text("\(product.rawValue)")
//                }
//            case .size50:
//                ForEach(sections, id: \.self) { product in
//                    Text("\(product.rawValue)")
//                }
//            }
//        }
//    }
//}
//
//struct ItemsToShowFilter_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemsToShowFilter()
//    }
//}
