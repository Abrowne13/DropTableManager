//
//  DropTable.swift
//  DropTableManager
//
//  Created by Ahmed Browne on 6/15/22.
//

import Foundation

public struct DropTable {
    public var id: Int
    public var drops: [DropTableDrop] = []
    public var name: String
    public var totalWeight: Int {
        drops.lazy.compactMap { $0.weight }
        .reduce(0, +)
    }
    
    public func roll() -> DropTableDrop? {
        if drops.count > 0 {
            let roll = Int.random(in: 1...totalWeight)
            var total = 0
            for drop in drops {
                if roll <= total + drop.weight {
                    return drop
                } else {
                    total += drop.weight
                }
            }
        }
        return nil
    }
}
