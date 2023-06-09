//
//  CDPlanetExtension.swift
//  Planets
//
//  Created by SravsRamesh on 08/06/23.
//

import Foundation


extension CDPlanet {
    func convertToPlanet() -> Planet {
        return Planet(name: self.name!)
    }
}
