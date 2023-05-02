//
//  SearchView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 13.04.2023.
//

import SwiftUI

struct SearchView: View {
    enum SizePicker: String, CaseIterable, Identifiable {
        case size38, size40, size42, size44, size46, size48, size50, sizeKids, sizeAccessorises
        var id: Self {
            self
        }
        var title: String {
            switch self {
            case .size38:
                return "38"
            case .size40:
                return "40"
            case .size42:
                return "42"
            case .size44:
                return "44"
            case .size46:
                return "46"
            case .size48:
                return "48"
            case .size50:
                return "50"
            case .sizeKids:
                return "детские платья"
            case .sizeAccessorises:
                return "аксессуары"
            }
        }
    } //пикер по размерам
    
    var products: [Product]
    @State private var selectedSize: SizePicker = .size42
    
    var filteredProducts: [Product] {
        let result = products.filter { $0.size.contains(selectedSize.title) }
        return result
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                    HStack {
                        Text("Выберете нужный вам размер платья")
                            .font(.custom(boldFont, size: 15))
                            .foregroundColor(colorFont)
                        Spacer()
                    }
                    ZStack{
                        Rectangle()
                            .cornerRadius(10)
                            .frame(height: 37)
                            .foregroundColor(.white)
                            .border(colorFontGray)
                        HStack{
                            Menu {
                                Picker("Выберете размер", selection: $selectedSize) {
                                    ForEach(SizePicker.allCases) { size in
                                        Text(size.title).tag(size)
                                            .foregroundColor(colorFont)
                                    }
                                }
                            } label: {
                                HStack{
                                    Text("\(selectedSize.title)")
                                        .font(.custom(mediumFont, size: 18))
                                        .foregroundColor(colorFont)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .font(.custom(mediumFont, size: 18))
                                        .foregroundColor(colorFont)
                                }
                                .padding([.leading, .trailing])
                            }
                        }
                        
                    }
                    
                }
                .padding([.top, .leading, .trailing])
                // Picker
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                        ForEach(filteredProducts, id: \.id) { product in
                            NavigationLink {
                                ItemDetailView(id: product.id, title: product.title, size: product.size, price_photo: product.price_photo, price_rent: product.price_rent ?? 0, deposit: product.deposit, description: product.description, link: product.link, image_link: product.image_link ?? ["https://i.ibb.co/wyBwfHG/IMG-7167.jpg"], availability: product.availability, price: product.price, condition: product.condition, isAddToFavorite: product.isAddToFavorite, category: product.category)
                            } label: {
                                ItemView(product: product)
                            }
                        }
                    }
                } // Лента с выбором отобранным ассортиментом
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(products: [example])
    }
}
