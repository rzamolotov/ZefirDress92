//
//  Favorite+CoreDataClass.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import Foundation
import CoreData


extension ProductFavorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductFavorite> {
        return NSFetchRequest<ProductFavorite>(entityName: "Favorites")
    }

    @NSManaged public var id: UUID?
  
}

extension ProductFavorite : Identifiable {

}
