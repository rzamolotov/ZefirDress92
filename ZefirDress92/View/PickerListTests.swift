//
//  PickerListTests.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.04.2023.
//

import SwiftUI

struct PickerListTests: View {
    enum Sizes: String, CaseIterable, Identifiable {
        case size38, size40, size42, size44, size46, size48, size50
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
            }
        }
    } //пикер по размерам
    enum Categories: String, CaseIterable, Identifiable {
        case dance, night, kids, photosession
        var id: Self {
            self
        }
        var title: String {
            switch self {
            case .dance:
                return "Платья для бала"
            case .night:
                return "Вечернее платье"
            case .kids:
                return "Детские"
            case .photosession:
                return "Фотосессия"
            }
        }
    }//пикер по категориям
    var products: [Product]
    @State private var selectedSize: Sizes = .size42
    @State private var selectedCategory: Categories = .night
    
    var filteredProducts: [Product] {
        let result = products.filter { $0.size.contains(selectedSize.title) && $0.category.contains(selectedCategory.title)}
        print("filteredProducts: \(result)")
        return result
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                Picker("Выберете размер", selection: $selectedSize) {
                    ForEach(Sizes.allCases) { size in
                        Text(size.title).tag(size)
                    }
                }
                .pickerStyle(.menu)
                Picker("Выберете категорию", selection: $selectedCategory) {
                    ForEach(Categories.allCases) { category in
                        Text(category.title).tag(category)
                    }
                }
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(filteredProducts, id: \.id) { product in
                            NavigationLink {
                                ItemDetailView(id: product.id, title: product.title, size: product.size, price_photo: product.price_photo, price_rent: product.price_rent ?? 0, deposit: product.deposit, description: product.description, link: product.link, image_link: product.image_link, availability: product.availability, price: product.price, condition: product.condition, isAddToFavorite: product.isAddToFavorite, category: product.category)
                            } label: {
                                ProductView(product: product)
                            }
                            
                            
                        }
                    }
                }
            }
        }
    }
}

struct PickerListTests_Previews: PreviewProvider {
    static var previews: some View {
        PickerListTests(products: [example])
    }
}
