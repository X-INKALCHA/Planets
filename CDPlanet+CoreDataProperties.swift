//
//  CDPlanet+CoreDataProperties.swift
//  Planets
//
//  Created by SravsRamesh on 08/06/23.
//
//

import Foundation
import CoreData


extension CDPlanet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPlanet> {
        return NSFetchRequest<CDPlanet>(entityName: "CDPlanet")
    }

    @NSManaged public var name: String?

}

extension CDPlanet : Identifiable {

}
