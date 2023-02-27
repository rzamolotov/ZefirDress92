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
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(product.image, id: \.self) { images in
                            Image(images)
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(10)
                                .shadow(radius: 7)
                                .frame(width: screen.width / 1.2, height: screen.height / 1.8)
                        }
                    }
                }
                ItemDescriptionView(product: self.product)
//                HStack {
//                    Text("\(product.price_photo) руб.")
//                        .fontWeight(.semibold)
//                        .padding()
//                }
//                .frame(width: screen.width, height: 30, alignment: .center)
//
//                Text(product.description)
//                    .font(.body)
//                    .foregroundColor(.secondary)
//                    .padding()
//
//
//                AddToCartButton(product: self.product)
//
//                Spacer()
            }
            .navigationBarTitle(
                Text(product.name),
                displayMode: .automatic)
            .navigationBarItems(
                trailing: Button(action: {
                    showOrderView.toggle()
                }, label: {
                    Image(systemName: "cart.fill")
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
            ItemDetailView(product: Product.example)
                .environmentObject(shop)
        }
    }
}
