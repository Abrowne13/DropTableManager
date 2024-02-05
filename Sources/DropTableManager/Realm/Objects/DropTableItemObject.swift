//
//  DropTableItemObject.swift
//  DropTableManager
//
//  Created by Ahmed Browne on 6/12/22.
//

import Foundation
import RealmSwift

public class DropTableItemObject: Object{
    @Persisted var id: Int
    @Persisted var itemListingId: Int
    @Persisted var name: String
    @Persisted var quantity: Int
    
    var dropTableItem: DropTableItem {
        let dropTableItem = DropTableItem(
            id: id,
            itemListingId: itemListingId,
            name: name,
            quantity: quantity
        )
        return dropTableItem
    }
    
    convenience init(id: Int, name: String, itemListingId: Int, quantity: Int) {
        self.init()
        self.id = id
        self.name = name
        self.itemListingId = itemListingId
        self.quantity = quantity
    }
    
    override public static func primaryKey() -> String? {
        return "id"
    }
}
