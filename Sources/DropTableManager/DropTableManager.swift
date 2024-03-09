//
//  DropTableManager.swift
//  DropTableManager
//
//  Created by Ahmed Browne on 6/15/22.
//

import Foundation

public class DropTableManager {
    private var persistanceManager: PersistanceManager
    
    public init() {
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
    
    public func updateDrop(id: Int, name: String? = nil, itemIds: [Int]? = nil, weight: Int? = nil) {
        persistanceManager.updateDrop(id: id, name: name, itemIds: itemIds,  weight: weight)
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
}
