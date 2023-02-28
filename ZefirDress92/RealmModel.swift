//
//  RealmModel.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 28.02.2023.
//

import Foundation
import RealmSwift

class RealmModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name = ""
    @Persisted var price = 0
}
