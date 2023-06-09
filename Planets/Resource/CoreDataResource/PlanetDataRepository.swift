//
//  PlanetDataRepository.swift
//  Planets
//
//  Created by SravsRamesh on 08/06/23.
//

import Foundation
import CoreData

struct PlanetDataRepository : PlanetCoreDataRepository {

    func batchInsertPlanetRecords(records: Array<Planet>) -> Bool {

        PersistentStorage.shared.printDocumentDirectoryPath()

        PersistentStorage.shared.persistentContainer.performBackgroundTask { privateManagedContext in

            // batch inserts
            let request = self.createBatchInsertRequest(records: records)
            do{
                try privateManagedContext.execute(request)
            }catch {
                debugPrint("batch insert error")
            }
        }

        return true

    }

    private func createBatchInsertRequest(records:Array<Planet>) -> NSBatchInsertRequest {

        let totalCount = records.count
        var index = 0

        let batchInsert = NSBatchInsertRequest(entity: CDPlanet.entity()) { (managedObject: NSManagedObject) -> Bool in

            guard index < totalCount else {return true}

            if let cdPlanet = managedObject as? CDPlanet {
                let data = records[index]
                cdPlanet.name = data.name
            }

            index  += 1
            return false
        }

        return batchInsert

    }

    func insertPlanetRecords(records: Array<Planet>) -> Bool {

        debugPrint("PlanetDataRepository: Insert record operation is starting")

        PersistentStorage.shared.persistentContainer.performBackgroundTask { privateManagedContext in
            //insert code
            records.forEach { planet in
                let cdPlanet = CDPlanet(context: privateManagedContext)
                cdPlanet.name = planet.name
            }

            if(privateManagedContext.hasChanges){
                try? privateManagedContext.save()
                debugPrint("PlanetDataRepository: Insert record operation is completed")
            }
        }

        return true
    }

// To get Planet records from database
    func getPlanetRecords(completionHandler: @escaping (Array<Planet>?) -> Void) {

        PersistentStorage.shared.printDocumentDirectoryPath()

        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDPlanet.self)
            var planets : Array<Planet> = []
            result?.forEach({ cdPlanet in
                planets.append(cdPlanet.convertToPlanet())
            })

            completionHandler(planets)

    }
}
