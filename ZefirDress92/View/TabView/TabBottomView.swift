//
//  TabBottomView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.04.2023.
//

import SwiftUI

struct TabBottomView: View {
    
    let tabbarItems: [TabItemData]
    @Binding var selectedIndex: Int
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(colorBackground)
                .frame(width: screen.width, height: screen.height / 11)
                .cornerRadius(20)
                .shadow(radius: 5, x: 0, y: 4)
            Rectangle()
                .foregroundColor(colorBackground)
                .frame(width: screen.width, height: screen.height / 10)
                .offset(y: 50)

            HStack {
                Spacer()
                ForEach(tabbarItems.indices, id: \.self) { index in
                    let item = tabbarItems[index]
                    Button {
                        self.selectedIndex = index
                    } label: {
                        let isSelected = selectedIndex == index
                        TabItemView(data: item, isSelected: isSelected)
                            .foregroundColor(colorBrightPink)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct TabBottomView_Preview: PreviewProvider {
    
    static var tabItemsData = [
        TabItemData(image: "house", selectedImage: "house.fill", title: "Все платья", isCart: false),
        TabItemData(image: "heart", selectedImage: "heart.fill", title: "Избранное", isCart: false),
        TabItemData(image: "cart", selectedImage: "cart.fill", title: "Корзина", isCart: true)
    ]
    static var previews: some View {
        TabBottomView(tabbarItems: tabItemsData, selectedIndex: .constant(2))
    }
}
