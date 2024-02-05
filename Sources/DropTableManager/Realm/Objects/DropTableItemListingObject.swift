//
//  DropTableItemListingObject.swift
//  LootCasino
//
//  Created by Ahmed Browne on 10/8/22.
//

import Foundation
import RealmSwift

public class DropTableItemListingObject: Object {
    @Persisted var id: Int
    @Persisted var name: String
    
    var dropTableListing: DropTableItemListing {
        return DropTableItemListing(id: id, name:  name)
    }
    
    convenience init(id: Int, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
    
    override public static func primaryKey() -> String? {
        return "id"
    }
}
