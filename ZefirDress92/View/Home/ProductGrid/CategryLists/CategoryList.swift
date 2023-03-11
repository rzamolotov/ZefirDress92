//
//  CategoryList.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.03.2023.
//

import SwiftUI

struct CategoryList: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var modelData: ModelData
    var product: Product
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading){
                    WelcomeMessageView()
                        .padding(.horizontal, 20)
                    
                    VStack {
                        ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                            CategoryRow(categoryName: key, product: product, items: modelData.categories[key]!)
                                .padding(.bottom, 15)
                                .padding(.top, 5)
                        }
                        .listRowInsets(EdgeInsets())
                    }
                    .padding()
                    
                    Spacer()
                }
            }
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList(product: products[0])
            .environmentObject(ModelData())
            .environmentObject(ViewRouter())
    }
}


