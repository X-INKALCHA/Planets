//
//  PlanetApiRepository.swift
//  Planets
//
//  Created by SravsRamesh on 08/06/23.
//

import Foundation
import CoreData

struct PlanetApiRepository : PlanetApiResourceRepository {

    func getPlanetRecords(completionHandler: @escaping (Array<Planet>?) -> Void) {

        URLSession.shared.dataTask(with: ApiResource.planetResource) { (data, response, error) in
            if(error == nil && data != nil) {
                let response = try? JSONDecoder().decode(PlanetResponse.self, from: data!)
                if let response = response {
                    completionHandler(response.planets)
                } else {
                    print(error as Any)
                }
            }
            

        }.resume()
    }
}
