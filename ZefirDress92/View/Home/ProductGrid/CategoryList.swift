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
            VStack(alignment: .leading){
                WelcomeMessage()
                    .padding(.horizontal, 20)
                
                List {
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, product: product, items: modelData.categories[key]!)
                            .padding(.bottom, 15)
                            .padding(.top, 5)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(.inset)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .padding(10)
                
                Spacer()
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

struct WelcomeMessage: View {
    @AppStorage("user_name") var user_name = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text("Привет, \(user_name)!")
                .font(.title)
                .bold()
                .padding(.top, 15)
            
            Text("Мы разобрали платья по категориям и по случаям к на которых вам будет лучше всего их использовать, чтобы вам было удобнее.ТЕКСТ ПОМЕНЯТЬ.")
                .kerning(-0.5)
                .multilineTextAlignment(.leading)
                .font(.headline)
        }
    }
}
