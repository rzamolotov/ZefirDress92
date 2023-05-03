//
//  AddToCartButton.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 27.02.2023.
//

import SwiftUI
import CoreData

struct AddToCartButton: View {
    
    var product: Product
    @StateObject var addToCartButtonVM: AddToCartViewModel
    
    var body: some View {
        Button(action: {
            addToCartButtonVM.toggleIsAddToCart()
        }, label: {
            ZStack{
                Rectangle()
                HStack {
                    Image(systemName: "cart")
                        .font(.custom(mediumFont, size: fontSizeLarge))
                        
                    Text("Забронировать на примерку\n\(product.title)")
                        .font(.custom(boldFont, size: fontSizeMedium))
                }
                .foregroundColor(colorBege)
            }
            .frame(width: screen.width / 1.1, height: screen.height / 12)
            .foregroundColor(colorBrightPink)
            .cornerRadius(10)
        })
    }
}

struct AddToCartButton_Previews: PreviewProvider {
    
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        NavigationView {
            AddToCartButton(product: example, addToCartButtonVM: AddToCartViewModel(viewContext: viewContext, product: example))
        }
    }
}
