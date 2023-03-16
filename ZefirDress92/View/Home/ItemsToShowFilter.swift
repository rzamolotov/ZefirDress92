//
//  ItemsToShowFilter.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 16.03.2023.
//

import SwiftUI

struct ItemsToShowFilter: View {
    
    let sections: [Product.Size] = Product.Size.allCases
    @State var selected: Product.Size = .size42
    
    var body: some View {
        VStack() {
            FilterView(items: sections, selectedItem: $selected)
            switch selected {
            case .size38:
                ForEach(38, id: \.self) { item in
                    Text(item)
                }
            case .size40:
                ForEach(40, id: \.self) { item in
                    Text(item)
                }
            case .size42:
                ForEach(42, id: \.self) { item in
                    Text(item)
                }
            case .size44:
                ForEach(44, id: \.self) { item in
                    Text(item)
                }
            case .size46:
                ForEach(46, id: \.self) { item in
                    Text(item)
                }
            case .size48:
                ForEach(48, id: \.self) { item in
                    Text(item)
                }
            case .size50:
                ForEach(50, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

struct ItemsToShowFilter_Previews: PreviewProvider {
    static var previews: some View {
        ItemsToShowFilter()
    }
}
