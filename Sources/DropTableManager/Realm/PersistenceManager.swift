//
//  PersistenceManager.swift
//  LootCasino
//
//  Created by Ahmed Browne on 10/1/22.
//

import Foundation
import RealmSwift

class PersistanceManager {
    private var realm: Realm
    
    init() {
        realm = try! Realm()
    }
    
    //MARK: Item Listings
    func addItemListing(name: String) {
        let key = (realm.objects(DropTableItemListingObject.self).max(ofProperty: "id") as Int? ?? 0) + 1
        
        do {
            try realm.write {
                let listing = DropTableItemListingObject(id: key, name: name)
                realm.add(listing)
            }
        } catch {
            print("Could not add item listing id: \(key) name: \(name) ", error)
        }
    }
    
    func getItemListings() -> [DropTableItemListing] {
        let listingObjects = realm.objects(DropTableItemListingObject.self)
        var listings = [DropTableItemListing]()
        
        for listing in listingObjects {
            listings.append(listing.dropTableListing)
        }
        return listings
    }
    
    func updateItemListing(id: Int, newName: String) {
        do {
            let listings = realm.objects(DropTableItemListingObject.self)
            for listing in listings {
                if listing.id == id {
                    try realm.write {
                        listing.name = newName
                    }
                }
            }
        } catch {
            print("Could not update item listing name with id: \(id) new name: \(newName) ", error)
        }
    }
    
    func removeItemListing(id: Int) {
        do {
            let listings = realm.objects(DropTableItemListingObject.self)
            for listing in listings {
                if listing.id == id {
                    try realm.write {
                        realm.delete(listing)
                    }
                }
            }
        } catch {
            print("Could not remove item listing: \(id)")
        }
    }
    
    //MARK: DropsItems
    func addDropItems(name: String, itemListingId: Int, quantity: Int) {
        let key = (realm.objects(DropTableItemObject.self).max(ofProperty: "id") as Int? ?? 0) + 1
        do {
            try realm.write {
                let drop = DropTableItemObject(
                    id: key,
                    name: name,
                    itemListingId: itemListingId,
                    quantity: quantity)
                realm.add(drop)
            }
        } catch {
            print("Could not add drop id: \(key)")
        }
    }

    func getDropItems() -> [DropTableItem] {
        let dropObjects = realm.objects(DropTableItemObject.self)
        var drops = [DropTableItem]()

        for dropObject in dropObjects {
            drops.append(dropObject.dropTableItem)
        }
        return drops
    }

    func removeDropItems(id: Int) {
        do {
            let drops = realm.objects(DropTableItemObject.self)
            for drop in drops {
                if drop.id == id {
                    try realm.write {
                        realm.delete(drop)
                    }
                }
            }
        } catch {
            print("Could not remove item with id: \(id)")
        }
    }
    
    //MARK: Drops
    func addDrop(name: String, itemIds: [Int], weight: Int) {
        let key = (realm.objects(DropTableDropObject.self).max(ofProperty: "id") as Int? ?? 0) + 1
        do {
            try realm.write {
                let drop = DropTableDropObject(
                    id: key,
                    name: name,
                    itemIds: itemIds,
                    weight: weight
                )
                realm.add(drop)
            }
        } catch {
            print("Could not add drop id: \(key)")
        }
    }

    func getDrops() -> [DropTableDrop] {
        let dropObjects = realm.objects(DropTableDropObject.self)
        var drops = [DropTableDrop]()

        for dropObject in dropObjects {
            drops.append(dropObject.dropTableDrop)
        }
        return drops
    }

    func removeDrop(id: Int) {
        do {
            let drops = realm.objects(DropTableDropObject.self)
            for drop in drops {
                if drop.id == id {
                    try realm.write {
                        realm.delete(drop)
                    }
                }
            }
        } catch {
            print("Could not remove drop with id: \(id)")
        }
    }
    

    //MARK: DropTables
    func addDropTable(name: String, dropIds: [Int]) {
        let key = (realm.objects(DropTableObject.self).max(ofProperty: "id") as Int? ?? 0) + 1
        let drops = dropIds.compactMap {
            id -> DropTableDropObject? in
            if let result = realm.objects(DropTableDropObject.self).filter("id == %@", id).first {
                return result
            }
            return nil
        }
        do {
            try realm.write {
                let dropTable = DropTableObject(
                    id: key,
                    name: name,
                    drops: drops
                )
                realm.add(dropTable)
            }
        } catch {
            print("Could not add dropTable id: \(key)")
        }
    }

    func getDropTables() -> [DropTable] {
        let dropObjects = realm.objects(DropTableObject.self)
        var dropTables = [DropTable]()

        for dropTableObject in dropObjects {
            dropTables.append(dropTableObject.dropTable)
        }
        return dropTables
    }

    func removeDropTable(id: Int) {
        do {
            let dropTables = realm.objects(DropTableObject.self)
            for dropTable in dropTables {
                if dropTable.id == id {
                    try realm.write {
                        realm.delete(dropTable)
                    }
                }
            }
        } catch {
            print("Could not remove dropTable with id: \(id)")
        }
    }
}
