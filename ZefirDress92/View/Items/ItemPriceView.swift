//
//  ItemPriceView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 08.03.2023.
//

import SwiftUI

struct ItemPriceView: View {
    var product: Product
    enum Event:  String, CaseIterable, Identifiable {
        case photo, event
        var id: Self { self }
    }
    
    @State private var selectedEvent: Event = .photo
    
    var body: some View {
        Picker("Выебрете тип аренды и стоимость", selection: $selectedEvent) {
            Text("Фотосессия \(product.price_photo) руб.").tag(Event.photo)
            Text("Мероприятие \(product.price_rent ?? 0) руб." ).tag(Event.event)
        }
        .pickerStyle(.segmented)
        .foregroundColor(.pink)
        .frame(width: screen.width / 1.1, height: screen.height / 29, alignment: .center)
        .background(Color.white.cornerRadius(5))
        .opacity(0.7)
        .background(RoundedRectangle(cornerRadius: 5).stroke(.pink, lineWidth:2))
    }
}


struct ItemPriceView_Previews: PreviewProvider {
    static var previews: some View {
        ItemPriceView(product: example)
    }
}
