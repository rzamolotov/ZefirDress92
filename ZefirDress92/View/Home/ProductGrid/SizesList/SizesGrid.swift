////
////  SizesGrid.swift
////  ZefirDress92
////
////  Created by Роман Замолотов on 29.03.2023.
////
//
//import SwiftUI
//
//struct SizesGrid: View {
//    @EnvironmentObject var viewRouter: ViewRouter
//    @EnvironmentObject var modelData: ModelData
//
//    var body: some View {
//        VStack{
//                SizeGridView(sizeName: modelData.sizes.keys.sorted(), products: modelData.sizes[modelData.sizes.keys.sorted()]!)
//                    .padding(.bottom, 15)
//                    .padding(.top, 5)
////            }
////            ForEach(modelData.sizes.keys.sorted(), id: \.self) { key in
////                SizeGridView(sizeName: key, products: modelData.sizes[key]!)
////                    .padding(.bottom, 15)
////                    .padding(.top, 5)
//            }
////            .listRowInsets(EdgeInsets())
//        }
//    }
////}
//
//
//
//
//struct SizesGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        SizesGrid()
//            .environmentObject(ModelData())
//            .environmentObject(ViewRouter())
//    }
//}
