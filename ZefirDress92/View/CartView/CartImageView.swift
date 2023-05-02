//
//  CartImageView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 02.05.2023.
//

import SwiftUI
import Kingfisher

struct CartImageView: View {
    var order: DressOrder
    var body: some View {
        
        let imageLinkArray = order.imageLink as? Array<String> ?? []
        KFImage(URL(string: imageLinkArray[0]))
                .placeholder({ progress in
                    ProgressView()
                })
                .resizable()
                .scaledToFill()
                .cornerRadius(10)
                .frame(width: screen.width / 5, height: screen.height / 12)
    }
}

struct CartImageView_Previews: PreviewProvider {
    
    static var order = DressOrder()
    static var previews: some View {
        CartImageView(order: order)
    }
}
