//
//  Network.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 29.03.2023.
//

import Foundation

actor Network {
    
    var products: [Product] {
        get async throws {
            let data = try await downloader.httpData(from: feedURL)
            let allProducts = try decoder.decode(ProductJSON.self, from: data)
            return allProducts.products
        }
    }
    
    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .millisecondsSince1970
        return aDecoder
    }()
    
    private let feedURL = URL(string: "https://api.npoint.io/df1413151726a38bd6fe")!
    
    private let downloader: HTTPDataDownloader
    
    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }
}
