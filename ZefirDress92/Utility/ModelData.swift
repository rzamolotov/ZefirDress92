//
//  ModelData.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.03.2023.
//

import Foundation

final class ModelData: ObservableObject {
    
    @Published var products: [Product] = load("product.json")
    
//    var categories: [String: [Product]] {
//        Dictionary(
//            grouping: products,
//            by: { $0.category.rawValue }
//        )
//    }
    var sizes: [String: [Product]] {
        Dictionary(
            grouping: products,
            by: { $0.size.first!.rawValue }
        )
    }
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data) // явное приведение типа
        return decodedData
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

