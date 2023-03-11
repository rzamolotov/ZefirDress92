//
//  ItemDetailView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct ItemDetailView: View {
    
    var product: Product
    @State private var isShareSheetShowing = false
    @State var showOrderView = false
    @EnvironmentObject var shop: Shop
    var numberOfProducts: Int
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                TabView {
                    ForEach(product.image, id: \.self) { images in
                        Image(images)
                            .resizable()
                            .scaledToFill()
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .shadow(radius: 5)
                .frame(width: screen.width, height: screen.height / 1.8)
                
                ItemDescriptionView(product: self.product)
            }
            .navigationBarTitle(
                Text(product.name),
                displayMode: .automatic)
            .navigationBarItems(
                trailing: Button(action: {
                    showOrderView.toggle()
                }, label: {
                    ZStack{
                        Image(systemName: "cart")
                            .foregroundColor(.black)
                        if numberOfProducts > 0 {
                            Text("\(numberOfProducts)")
                                .font(.caption2).bold()
                                .foregroundColor(.white)
                                .frame(width: 15, height: 15)
                                .background(colorOrange)
                                .cornerRadius(60)
                                .offset(x: 13, y: -10)
                        }
                    }
                })
            )
            .sheet(isPresented: $showOrderView) {
                NavigationView {
                    CartView()
                        .environmentObject(shop)
                }
            }
        }
        
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static let shop = Shop()
    static var previews: some View {
        NavigationView {
            ItemDetailView(product: Product.example, numberOfProducts: 1)
                .environmentObject(shop)
        }
    }
}
