//
//  UserName.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.03.2023.
//

import SwiftUI

struct UserName: View {
    @Binding var username: String
    
    var body: some View {
        TextField("Введите ваше имя", text: $username)
            .padding()
            .background(colorBackground)
            .frame(width: screen.width / 1.1, height: 60)
            .cornerRadius(15.0)
    }
}

struct UserName_Previews: PreviewProvider {
    static var previews: some View {
        UserName(username: .constant("Введите ваше имя"))
    }
}
