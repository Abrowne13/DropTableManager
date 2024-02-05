//
//  DropTableDrop.swift
//  DropTableManager
//
//  Created by Ahmed Browne on 6/13/22.
//

import Foundation
import RealmSwift

public class DropTableDropObject: Object {
    @Persisted var id: Int
    @Persisted var itemIds = RealmSwift.List<Int>()
    @Persisted var name: String
    @Persisted var weight: Int
    
    var dropTableDrop: DropTableDrop {
        var dropTableDrop = DropTableDrop(
            id: id,
            name: name,
            weight: weight
        )
        dropTableDrop.itemIds = itemIds.compactMap{$0 as Int}
        return dropTableDrop
    }
    
    convenience init(id: Int, name: String, itemIds: [Int], weight: Int) {
        self.init()
        self.id = id
        self.name = name
        self.itemIds.append(objectsIn: itemIds)
        self.weight = weight
    }
    
    override public static func primaryKey() -> String? {
        return "id"
    }
}
