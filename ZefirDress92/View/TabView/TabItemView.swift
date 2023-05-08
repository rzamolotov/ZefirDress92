//
//  TabItemView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.04.2023.
//

import SwiftUI

struct TabItemView: View {
    let data: TabItemData
    var isSelected: Bool
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: DressOrder.entity(), sortDescriptors: [])
    var orders: FetchedResults<DressOrder>
    
    var body: some View {
        VStack {
            ZStack{
                Image(systemName: isSelected ? data.selectedImage : data.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .animation(.default, value: 1)
                if data.isCart == true && orders.count > 0 {
                    Text("\(orders.count)")
                        .font(.custom(boldFont, size: fontSizeVerySmall))
                        .foregroundColor(colorFont)
                        .frame(width: 15, height: 15)
                        .background(colorPink)
                        .cornerRadius(60)
                        .offset(x: 13, y: -10)
                }
            }
            
            Spacer().frame(height: 4)
            
            Text(data.title)
                .foregroundColor(isSelected ? colorFont : colorFontGray)
                .font(.custom(mediumFont, size: fontSizeVerySmall / 1.5))
         
        }
        .frame(width: screen.width / 7, height: screen.width / 9)
    }
}

struct TabItemView_Previews: PreviewProvider {
    static var data = TabItemData(image: "house", selectedImage: "house.fill", title: "все платья", isCart: false)
    static var previews: some View {
        TabItemView(data: data, isSelected: true)
    }
}
