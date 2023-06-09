//
//  PlanetRepository.swift
//  Planets
//
//  Created by SravsRamesh on 08/06/23.
//

import Foundation


protocol PlanetBaseRepository {
    func getPlanetRecords(completionHandler:@escaping(_ result: Array<Planet>?)->Void)
}
protocol PlanetCoreDataRepository : PlanetBaseRepository {
    func insertPlanetRecords(records:Array<Planet>) -> Bool
    func batchInsertPlanetRecords(records:Array<Planet>) -> Bool
}

protocol PlanetApiResourceRepository : PlanetBaseRepository {
}
