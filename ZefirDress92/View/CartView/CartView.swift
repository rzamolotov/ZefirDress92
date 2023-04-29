//
//  CartView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 27.02.2023.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var productProvider: ProductProvider
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: DressOrder.entity(), sortDescriptors: [])
    var orders: FetchedResults<DressOrder>
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    List {
                        ForEach(orders) { order in
                            NavigationLink {
                                ItemDetailView(id: order.id ?? "0", title: order.title ?? "Olivia", size: order.size as! [String], price_photo: Int(order.price_photo), price_rent: Int(order.price_rent), deposit: Int(order.deposit), description: order.itemDescription ?? "", link: order.itemLink ?? "", image_link: order.image_link as? [String] ?? ["https://i.ibb.co/wBRzd2B/IMG-1499.jpg"], availability: order.availability!, price: order.price!, condition: order.condition ?? "", isAddToFavorite: order.isAddToFavorite, category: order.category as! [String])
                            } label: {
                                HStack {
                                    CartProductInfo(order: order)
                                    Spacer()
                                    PriceCartView(order: order)
                                    
                                }
                            }
                            .frame(height: 100)
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                viewContext.delete(orders[index])
                            }
                            do {
                                try viewContext.save()
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                    .listStyle(.grouped)
                    .navigationTitle("Корзина")
                    
                    
                    if(orders.count > 0) {
                        Total(orders: orders)
                        SendOrderButton()
                            .padding(.bottom, 50)
                        
                    }
                    
                }
                if(orders.count == 0) {
                    EmptyCartView()
                }
                
            }
        }
        
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CartView()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .environmentObject(ProductProvider())
        }
    }
}


