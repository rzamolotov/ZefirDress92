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
    
    @Published var dataProduct: Product?
    @Published var isLoading = true
    @Published var searchQuery = ""
    
    init() {
        self.fetchProductData()
    }
    
    func fetchProductData(){
        guard let url = URL(string: "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239") else {
            fatalError("INVALID URL")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            let result = try? JSONDecoder().decode(Product.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    self.dataProduct = result
                    print(result)
                }
            }
        }.resume()
    }
}
