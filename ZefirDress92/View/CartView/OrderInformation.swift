//
//  OrderInformation.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 15.03.2023.
//

import SwiftUI

struct OrderInformation: View {
    @Binding var user_name: String
    @Binding var user_phone_number: String
    @Binding var user_address: String
    
    var body: some View {
        let infoAvailable: Bool = !user_name.isEmpty && !user_phone_number.isEmpty && !user_address.isEmpty
        
        VStack(alignment: .leading, spacing: 5) {
            Text("Информация о доставке")
                .font(.headline)
                .padding(.bottom, 5)
            
            if(!infoAvailable){
                Text("Введите свои контактные данные и адрес доставки")
                    .font(.subheadline)
                    .foregroundColor(.red)
            } else {
                Text(user_name)
                    .font(.subheadline)
                Text(user_phone_number)
                    .font(.caption)
                    .foregroundColor(.secondary)
                HStack{
                    Text(user_address)
                        .font(.subheadline)
                    Spacer()
                    Text("Адрес доставки")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
            }
        }
        .padding(.top)
        .padding(.bottom)
    }
}

struct OrderInformation_Previews: PreviewProvider {
    static var previews: some View {
        OrderInformation(user_name: .constant("Юля"), user_phone_number: .constant("+79787242551"), user_address: .constant("Спуск Шестакова 1"))
    }
}
