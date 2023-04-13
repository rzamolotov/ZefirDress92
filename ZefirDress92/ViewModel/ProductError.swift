//
//  ProductError.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 31.03.2023.
//

import Foundation

enum ProductError: Error {
    case missingData
    case networkError
    case unexpectedError(error: Error)
}

extension ProductError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Discarding missing a valid name, image etc.", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching item data over the network.", comment: "")
        case .unexpectedError(let error):
            return NSLocalizedString("Received unexpected error. \(error.localizedDescription)", comment: "")
        }
    }
}
