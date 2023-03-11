//
//  SkipButton.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.03.2023.
//

import SwiftUI

struct SkipButton: View {
    @Binding var skipAuth: Bool
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        HStack{
            Spacer()
            Button {
                self.skipAuth = true
                withAnimation(){
                    viewRouter.currentPage = .landing
                }
            } label: {
                Text("Войти без регистрации")
                    .foregroundColor(.pink)
                    .opacity(0.7)
                    .font(.subheadline)
            }
        }
    }
}

struct SkipButton_Previews: PreviewProvider {
    static var previews: some View {
        SkipButton(skipAuth: .constant(false))
    }
}
