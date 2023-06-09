//
//  Planet+CoreDataProperties.swift
//  Planets
//
//  Created by SravsRamesh on 08/06/23.
//
//

import Foundation
import CoreData


extension Planet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Planet> {
        return NSFetchRequest<Planet>(entityName: "Planet")
    }

    @NSManaged public var name: String?

}

extension Planet : Identifiable {

}
