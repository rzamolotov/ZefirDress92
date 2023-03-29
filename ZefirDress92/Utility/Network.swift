//
//  Network.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 29.03.2023.
//

import Foundation
import SwiftUI
import Combine

class Network: ObservableObject {
    
    @Published var dataProduct: [Product] = []
    
    var categories: [String: [Product.Category]] {
        Dictionary(
            grouping: dataProduct.flatMap(\.category),
            by: { $0.rawValue }
        )
    }
    var sizes: [String: [Product]] {
        Dictionary(
            grouping: dataProduct,
            by: { $0.size.first!.rawValue }
        )
    }
    
    init() {}
    
    func fetchProductData(){
        guard let url = URL(string: "https://run.mocky.io/v3/ca646140-cd48-4c54-a349-d894374da6cd") else {
            fatalError("INVALID URL")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            let result = try? JSONDecoder().decode([Product].self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    self.dataProduct = result
                    print(result)
                }
            }
        }.resume()
    }
    func loadData() {
          fetchProductData()
      }
}
