//
//  PaymentInformation.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 15.03.2023.
//

import SwiftUI

struct PaymentInformation: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text("Платежная информация")
                .font(.headline)
                .padding(.bottom, 5)
            Text("Карта")
                .font(.subheadline)
            HStack {
                Text("Мир...1234")
                    .font(.caption)
                Spacer()
                Image(systemName: "creditcard.fill")
                    .font(.headline)
                    .foregroundColor(.red)
            }
        }
        .padding(.top)
        .padding(.bottom)
    }
}

struct PaymentInformation_Previews: PreviewProvider {
    static var previews: some View {
        PaymentInformation()
    }
}
