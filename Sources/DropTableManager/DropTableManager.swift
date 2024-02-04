//
//  DropTableManager.swift
//  DropTableManager
//
//  Created by Ahmed Browne on 6/15/22.
//

import Foundation

public class DropTableManager {
    private var persistanceManager: PersistanceManager
    
    init() {
        persistanceManager = PersistanceManager()
    }
    
    //MARK: Item Listings
    public func addItemListing(name: String) {
        persistanceManager.addItemListing(name: name)
    }
    
    public func getItemListings() -> [DropTableItemListing] {
        persistanceManager.getItemListings()
    }
    
    public func updateItemListings(id: Int, newName: String) {
        persistanceManager.updateItemListing(id: id, newName: newName)
    }
    
    public func removeItemListing(id: Int) {
        persistanceManager.removeItemListing(id: id)
    }
    
    //MARK: Drop Items
    
    public func addDropItems(name: String, itemListingId: Int, quantity: Int) {
        persistanceManager.addDropItems(name: name, itemListingId: itemListingId, quantity: quantity)
    }
    
    public func getDropItems() -> [DropTableItem] {
        persistanceManager.getDropItems()
    }
    
    public func removeDropItems(id: Int) {
        persistanceManager.removeDrop(id: id)
    }
    
    //MARK: Drops
    public func addDrop(name: String, itemIds: [Int], weight: Int) {
        persistanceManager.addDrop(name: name, itemIds: itemIds, weight: weight)
    }
    
    public func getDrops() -> [DropTableDrop] {
        persistanceManager.getDrops()
    }
    
    public func removeDrop(id: Int) {
        persistanceManager.removeDrop(id: id)
    }
    
    
    //MARK: Drop Tables
    public func addDropTable(name: String, dropIds: [Int]) {
        persistanceManager.addDropTable(name: name, dropIds: dropIds)
    }
    
    public func getDropTables() -> [DropTable] {
        persistanceManager.getDropTables()
    }
    
    public func removeDropTable(id: Int) {
        persistanceManager.removeDropTable(id: id)
    }
    
    //!! Again consider getting slotMachine table by name
    //!! The function does not iterate through all drops
    func expectedValue(playCost: Int) -> Double {
        var ev = -1.0
        let dropItems = self.getDropItems()
        if let table = self.getDropTables().first {
            for drop in table.drops {
                for itemId in drop.itemIds {
                    if let dropItem = dropItems.first(where:{$0.id == itemId}) {
                        let amount = dropItem.quantity
                        ev += Double(amount - playCost) * Double(drop.weight)/Double(table.totalWeight)
                    }
                }
            }
            return ev
        } else {
            print("could not return table for expected value")
            return 0
        }
    }
}
