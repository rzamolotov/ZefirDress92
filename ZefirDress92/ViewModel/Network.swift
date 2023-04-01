//
//  Network.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 29.03.2023.
//

import Foundation

actor Network {
    
    private let productCache: NSCache<NSString, CacheEntryObject> = NSCache()
    
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
    
    private let feedURL = URL(string: "https://run.mocky.io/v3/1ac244f4-fce3-4d6f-93d6-494d77bcea27")!
    
    private let downloader: HTTPDataDownloader
    
    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }
    
    func productItem(from url: URL) async throws -> Product {
        if let cached = productCache[url] {
            switch cached {
            case .ready(let item):
                return item
            case .inProgress(let task):
                return try await task.value
            }
        }
        
        let task = Task<Product, Error>{
            let data = try await downloader.httpData(from: url)
            let item = try decoder.decode(Product.self, from: data)
            return item
        }
        productCache[url] = .inProgress(task)
        do {
            let item = try await task.value
            productCache[url] = .ready(item)
            return item
        } catch {
            productCache[url] = nil
            throw error
        }
    } // функция получения данных для кэша
}
