//
//  CartView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 27.02.2023.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var editMode = EditMode.inactive
    @State private var customerName: String = ""
    @State private var customerAdress: String = ""
    @State private var customerDate: String = ""
    
    var body: some View {
        List {
            Section {
                TextField(
                    "Введите ваше имя",
                    text: $customerName
                )
                .disableAutocorrection(true)
                TextField(
                    "Введите адрес доставки",
                    text: $customerAdress
                )
                .disableAutocorrection(true)
                TextField(
                    "Выберите удобную дату",
                    text: $customerDate
                )
                .disableAutocorrection(true)
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Корзина")
        .navigationBarItems(trailing: EditButton(editMode: $editMode))
        .environment(\.editMode, $editMode)
        .animation(.spring(response: 0))
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CartView()
        }
    }
}

