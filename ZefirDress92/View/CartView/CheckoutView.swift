//
//  CheckoutView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct CheckoutView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State private var showAlert = false
    
    var body: some View {
        Form {
            Section(header: Text("Итого: 2000 руб.").font(.largeTitle)) {
                Button(action: {
                    showAlert.toggle()
                    presentationMode.wrappedValue.dismiss()
                    // TODO: отправить полученные данные на реалм

                }, label: {
                    Text("Подтвердить заказ на доставку")
                })
            }
        }
        .navigationBarTitle(Text("Заказ"), displayMode: .inline)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Заказ подтвержден"),
                message: Text("Ваш заказ успешно размещен, наш менеджер скоро с вами свяжется."),
                dismissButton: .default(Text("OK")))
        }
    }
}


struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
