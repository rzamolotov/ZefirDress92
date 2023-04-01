//
//  TestDownloader.swift
//  ZefirDress92Tests
//
//  Created by Роман Замолотов on 01.04.2023.
//

import Foundation

class TestDownloader: HTTPDataDownloader {
    func httpData(from: URL) async throws -> Data {
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
        return testProductData
    }
}
