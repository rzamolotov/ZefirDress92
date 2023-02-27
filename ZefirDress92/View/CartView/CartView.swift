//
//  CartView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 27.02.2023.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var shop: Shop
    @Environment(\.presentationMode) var presentationMode
    @State var editMode = EditMode.inactive
    
    var body: some View {
        List {
            Section {
                ForEach(shop.products) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("\(item.price_photo) руб.")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            
            Section {
                NavigationLink(
                    destination: CheckoutView().environmentObject(shop)) {
                        Text("Оформить заказ")
                    }
            }
            .disabled(shop.products.isEmpty)
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Корзина")
        .navigationBarItems(trailing: EditButton(editMode: $editMode))
        .environment(\.editMode, $editMode)
        .animation(.spring(response: 0))
    }
    
    // MARK: - Functions
    // Delete items
    func deleteItems(at offsets: IndexSet) {
        shop.products.remove(atOffsets: offsets)
    }
}

struct CartView_Previews: PreviewProvider {
    static let shop = Shop()
    static var previews: some View {
        NavigationView {
            CartView()
                .environmentObject(shop)
        }
    }
}

