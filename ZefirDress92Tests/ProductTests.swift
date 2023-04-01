//
//  ProductTests.swift
//  ZefirDress92Tests
//
//  Created by Роман Замолотов on 31.03.2023.
//

import XCTest
@testable import ZefirDress92

class ZefirDressTests: XCTestCase {
    
    func testProductJSONDecoderDecodesProduct() throws {
        let decoder = JSONDecoder()
        let product = try decoder.decode(Product.self, from: testFeature_nc73649170)
        
        XCTAssertEqual(product.id, "21747874")
        XCTAssertEqual(product.size, ["40", "42"])
        XCTAssertEqual(product.category, ["Платья для бала"])
    }
    
    func testProductJSONDecoderDecodesProductJSON() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let decoded = try decoder.decode(ProductJSON.self, from: testProductData)
        
        XCTAssertEqual(decoded.products.count, 1)
        XCTAssertEqual(decoded.products[0].size, ["40", "42"])
    }
}
