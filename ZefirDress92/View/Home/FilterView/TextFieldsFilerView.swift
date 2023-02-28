//
//  TextFieldFilerView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 28.02.2023.
//

import SwiftUI

struct TextFieldsFilerView: View {
    //MARK: - Property
    var event = ["Вечеринка", "Фотосессия", "Бал", "Природа", "Мероприятие"]
    @State private var selectedEvent = "Фотосессия"
    var color = ["Чёрный", "Зеленый", "Золотой", "Белый", "Серебристый", "Желтый", "Красный"]
    @State private var selectColor = "Чёрный"
    var size = ["38 размер", "40 размер", "42 размер", "44 размер", "46 размер", "48 размер", "50 размер"]
    @State private var selectedSize = "42 размер"
    
    //MARK: - Body
    var body: some View {
        VStack {
            //Me
            VStack {
                HStack {
                    Text("Мероприятие")
                        .font(.custom("MarkPro-Medium", size: 18))
                        .foregroundColor(colorBlue)
                    Spacer()
                }
                ZStack{
                    Rectangle()
                        .frame(height: screen.height / 21)
                        .foregroundColor(.white)
                        .border(buttonGray)
                    HStack{
                        Menu {
                            Picker(selection: $selectedEvent) {
                                ForEach(event, id: \.self) {
                                    Text($0)
                                }
                            } label: {}
                        } label: {
                            HStack{
                                Text("\(selectedEvent)")
                                    .font(.custom("MarkPro-Regular", size: 18))
                                    .foregroundColor(colorBlue)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .font(.custom("MarkPro-Regular", size: 18))
                                    .foregroundColor(colorBlue)
                            }
                            .padding([.trailing, .leading])
                        }
                        
                    }
                }
            }
            //:Brand
            //Price
            VStack {
                HStack {
                    Text("Цвет")
                        .font(.custom("MarkPro-Medium", size: 18))
                        .foregroundColor(colorBlue)
                    Spacer()
                }
                
                ZStack{
                    Rectangle()
                        .frame(height: screen.height / 21)
                        .foregroundColor(.white)
                        .border(buttonGray)
                    HStack{
                        Menu {
                            Picker(selection: $selectColor) {
                                ForEach(color, id: \.self) {
                                    Text($0)
                                }
                            } label: {}
                        } label: {
                            HStack{
                                Text("\(selectColor)")
                                    .font(.custom("MarkPro-Regular", size: 18))
                                    .foregroundColor(colorBlue)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .font(.custom("MarkPro-Regular", size: 18))
                                    .foregroundColor(colorBlue)
                            }
                            .padding([.trailing, .leading])
                        }
                    }
                }
            }
            //:Price
            //Size
            VStack {
                HStack {
                    Text("Размер")
                        .font(.custom("MarkPro-Medium", size: 18))
                        .foregroundColor(colorBlue)
                    Spacer()
                }
                
                ZStack{
                    Rectangle()
                        .frame(height: screen.height / 21)
                        .foregroundColor(.white)
                        .border(buttonGray)
                    HStack{
                        Menu {
                            Picker(selection: $selectedSize) {
                                ForEach(size, id: \.self) {
                                    Text($0)
                                }
                            } label: {}
                        } label: {
                            HStack{
                                Text("\(selectedSize)")
                                    .font(.custom("MarkPro-Regular", size: 18))
                                    .foregroundColor(colorBlue)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .font(.custom("MarkPro-Regular", size: 18))
                                    .foregroundColor(colorBlue)
                            }
                            .padding([.trailing, .leading])
                        }
                    }
                }
            }
            //:Size
        }
        .padding([.trailing, .leading])
    }
}

struct TextFieldsFilerView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldsFilerView()
    }
}
