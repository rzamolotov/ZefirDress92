//
//  Password.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.03.2023.
//

import SwiftUI

struct Password: View {
    @Binding var password: String
    
    var body: some View {
        SecureField("Введите пароль", text: $password)
            .padding()
            .background(colorFontGray)
            .frame(width: screen.width / 1.1, height: 60)
            .cornerRadius(15.0)
    }
}

struct Password_Previews: PreviewProvider {
    static var previews: some View {
        Password(password: .constant("Введите пароль"))
    }
}
