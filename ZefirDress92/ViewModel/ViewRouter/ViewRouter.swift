//
//  ViewRouter.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 11.03.2023.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .landing //this gets observed by other views
}
