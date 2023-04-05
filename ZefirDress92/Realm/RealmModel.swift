//
//  RealmModel.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 05.04.2023.
//

import Foundation
import RealmSwift

class RealmModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var isAddToFavorite = false
}
