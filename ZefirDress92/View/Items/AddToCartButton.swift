//
//  AddToCartButton.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 27.02.2023.
//

import SwiftUI

struct AddToCartButton: View {
    
    var product: Product
    
    var body: some View {
        Button(action: {
//TODO: ADD TO CART
        
            
        }, label: {
        ZStack{
            Rectangle()
            HStack{
                Image(systemName: "cart")
                    .font(.title)
                Text("Добавить в корзину \(product.name)")
            }
            .foregroundColor(.white)
        }
        .frame(width: screen.width / 1.1, height: 60)
        .foregroundColor(.pink)
        .opacity(0.7)
        .cornerRadius(15.0)
        })
    }
}

struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddToCartButton(product: Product.example)
        }
    }
}
