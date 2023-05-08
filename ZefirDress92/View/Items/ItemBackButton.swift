//
//  ItemBackButton.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 08.05.2023.
//

import SwiftUI

struct ItemBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            HStack{
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.custom(mediumFont, size: fontSizeLarge))
                        .foregroundColor(colorBrightPink)
                }
                Spacer()
            }
            
            HeaderViewHomeScreen()
        }
    }
}


struct ItemBackButton_Previews: PreviewProvider {
    static var previews: some View {
        ItemBackButton()
    }
}
