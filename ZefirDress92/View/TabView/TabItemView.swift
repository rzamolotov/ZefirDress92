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
    var itemsCount = 10
    
    var body: some View {
        VStack {
            Image(systemName: isSelected ? data.selectedImage : data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .animation(.default, value: 1)
                
            
            Spacer().frame(height: 4)
            
            Text(data.title)
                .foregroundColor(isSelected ? .black : .gray)
                .font(.custom("", size: 10))
            
                
        }
        .frame(width: 50, height: 45)
    }
}

struct TabItemView_Previews: PreviewProvider {
    static var data = TabItemData(image: "house", selectedImage: "house.fill", title: "все платья")
    static var previews: some View {
        TabItemView(data: data, isSelected: true)
    }
}
