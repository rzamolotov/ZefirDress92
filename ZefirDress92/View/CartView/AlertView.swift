//
//  AlertView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import SwiftUI

struct AlertView: View {
    @Binding var presentAlert: Bool
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Отлично!".uppercased())
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
                .foregroundColor(.primary)
            
            Text("Ваша заявка принята, в ближайшее время наш опертаор с вами свяжется")
                .font(.callout)
            
            Button(action: {
                withAnimation(){
                    presentAlert = false
                }
            }) {
                Text("Продолжить")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 150, height: 45)
                    .background(.pink)
                    .opacity(0.9)
                    .cornerRadius(15.0)
            }
        }
        .frame(maxWidth: 250)
        .padding()
        .background(.white)
        .cornerRadius(CGFloat(21.0))
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.opacity)
        
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(presentAlert: Binding.constant(true))
    }
}
