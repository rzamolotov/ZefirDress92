//
//  PlaceOrder.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 15.03.2023.
//

import SwiftUI

struct PlaceOrder: View {
    
    @Binding var showOrderConfirmAlert: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(){
                showOrderConfirmAlert = true
            }
            
            //TODO: Здесь должна проходить отправка заказа на сервер
            
        }) {
            Text("Оформить заказ")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: screen.width / 1.1, height: 60)
                .background(Color.pink)
                .opacity(0.7)
                .cornerRadius(15.0)
        }
        .padding(.leading)
        .padding(.trailing)
        .padding(.bottom)
    }
}

struct PlaceOrder_Previews: PreviewProvider {
    static var previews: some View {
        PlaceOrder(showOrderConfirmAlert: .constant(false))
    }
}
