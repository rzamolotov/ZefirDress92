//
//  CartView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 27.02.2023.
//

import SwiftUI

struct CartView: View {
    
    @AppStorage("user_name") var user_name = ""
    @AppStorage("user_phone_number") var user_phone_number = ""
    @AppStorage("user_email") var user_email = ""
    @AppStorage("user_address") var user_address = ""
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var network: Network
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: DressOrder.entity(), sortDescriptors: [])
    var orders: FetchedResults<DressOrder>
    
    @State var editMode = EditMode.inactive
    @State private var customerName: String = ""
    @State private var customerAdress: String = ""
    @State private var customerDate: String = ""
    
    @State var showAccountInfoSheet: Bool = false
    @State var showOrderConfirmAlert: Bool = false
    @State var couponApplied: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    List {
                        ForEach(orders) { order in
                            HStack {
                                CartProductInfo(order: order)
                                Spacer()
                                PriceCartView(order: order)
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
                    .navigationBarItems(trailing: Button(action: {
                        showAccountInfoSheet = true
                    }, label: {
                        Image(systemName: "person.circle")
                            .imageScale(.large)
                    }))
                    .sheet(isPresented: $showAccountInfoSheet){
                        AccountSheet(user_name: $user_name, user_phone_number: $user_phone_number, user_email: $user_email, user_address: $user_address, showAccountInfoSheet: $showAccountInfoSheet)
                    }
                    
                    if(orders.count > 0) {
                        Total(orders: orders)
                        
                        PlaceOrder(showOrderConfirmAlert: $showOrderConfirmAlert)
                    }
                    
                }
                if(orders.count == 0) {
                    EmptyCartView()
                }
                
                if(showOrderConfirmAlert){
                    AlertView(presentAlert: $showOrderConfirmAlert)
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
                .environmentObject(Network())
        }
    }
}


