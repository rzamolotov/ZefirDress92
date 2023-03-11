//
//  WelcomeMessageView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.03.2023.
//

import SwiftUI

struct WelcomeMessageView: View {
    @AppStorage("user_name") var user_name = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text("Привет, \(user_name)!")
                .font(.title)
                .bold()
                .padding(.top, 15)
            
            Text("Мы разобрали платья по категориям и по случаям к на которых вам будет лучше всего их использовать, чтобы вам было удобнее.ТЕКСТ ПОМЕНЯТЬ.")
                .kerning(-0.5)
                .multilineTextAlignment(.leading)
                .font(.headline)
        }
    }
}

struct WelcomeMessageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeMessageView()
    }
}
