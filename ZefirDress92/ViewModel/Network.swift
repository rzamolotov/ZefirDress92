//
//  Network.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 29.03.2023.
//

import Foundation

class Network {
    
//    private let productCache: NSCache<NSString, CacheEntryObject> = NSCache()
    
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
    
    private let feedURL = URL(string: "https://run.mocky.io/v3/ca646140-cd48-4c54-a349-d894374da6cd")!
    
    private let downloader: HTTPDataDownloader
   
   

    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }

//    func fetchImageData(from url: URL) async throws -> Product {
//        if let cached = productCache[url]{
//            switch cached{
//            case .ready(let image):
//                return image
//            case .inProgress(let task):
//                return try await task.value
//            }
//        }
//        let task = Task<Product, Error> {
//            let data = try await downloader.httpData(from: url)
//            let image = try decoder.decode(Product.self, from: data)
//            return image
//        }
//        productCache[url] = .inProgress(task)
//        do {
//            let image = try await task.value
//            productCache[url] = .ready(image)
//            return image
//        } catch {
//            productCache[url] = nil
//            throw error
//        }
//    }
  }
    
    
//    init() {}
//    func fetchProductData(){
//        guard let url = URL(string: "https://run.mocky.io/v3/ca646140-cd48-4c54-a349-d894374da6cd") else {
//            fatalError("INVALID URL")
//        }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            let result = try? JSONDecoder().decode([Product].self, from: data)
//
//            if let result = result {
//                DispatchQueue.main.async {
//                    self.dataProduct = result
//                    print(result)
//                }
//            }
//        }.resume()
//    }
//    func loadData() {
//          fetchProductData()
//      }
//}
