//
//  CartImageView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 02.05.2023.
//

import SwiftUI

struct CartImageView: View {
    var order: DressOrder
    var body: some View {
        
        let imageLinkArray = order.imageLink as? Array<String> ?? []
        AsyncImage(url: URL(string: imageLinkArray[0])!, placeholder:{ ProgressView()}, image:  { Image(uiImage: $0) .resizable() } )

                .aspectRatio(contentMode: .fill)
                .frame(width: screen.width / 3, height: screen.height / 6)
                .cornerRadius(10)
                .shadow(radius: 1)
    }
}

struct CartImageView_Previews: PreviewProvider {
    
    static var order = DressOrder()
    static var previews: some View {
        CartImageView(order: order)
    }
}
