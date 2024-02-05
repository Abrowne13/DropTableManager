//
//  DropTableObject.swift
//  DropTableManager
//
//  Created by Ahmed Browne on 6/15/22.
//

import Foundation
import RealmSwift

public class DropTableObject: Object {
    @Persisted var id: Int
    @Persisted var drops = RealmSwift.List<DropTableDropObject>()
    @Persisted var name: String
    
    var dropTable: DropTable {
        var dropTableDrops: [DropTableDrop] = []
        for dropObject in drops {
            dropTableDrops.append(dropObject.dropTableDrop)
        }
        let dropTable = DropTable(
            id: id,
            drops: dropTableDrops,
            name: name
        )
        return dropTable
    }
    
    convenience init(id: Int, name: String, drops: [DropTableDropObject]) {
        self.init()
        self.id = id
        self.name = name
        self.drops.append(objectsIn: drops)
    }
    
    override public static func primaryKey() -> String? {
        return "id"
    }
}
