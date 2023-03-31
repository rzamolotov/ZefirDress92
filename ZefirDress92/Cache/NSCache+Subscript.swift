//
//  NSCache+Subscript.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 31.03.2023.
//

import Foundation

extension NSCache where KeyType == NSString, ObjectType == CacheEntryObject { //Этот кода работет только с объектами cache
    subscript(_ url: URL) -> CacheEntry? {
        get {
            let key = url.absoluteString as NSString
            let value = object(forKey: key)
            return value?.entry
        }
        set {
            let key = url.absoluteString as NSString
            if let entry = newValue {
                let value = CacheEntryObject(entry: entry)
                setObject(value, forKey: key)
            } else {
                removeObject(forKey: key)
            }
        }
    }
    
}
