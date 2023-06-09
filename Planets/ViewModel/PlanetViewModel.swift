//
//  PlanetViewModel.swift
//  Planets
//
//  Created by SravsRamesh on 08/06/23.
//

import Foundation

struct PlanetViewModel {

    private let _cdPlanetDataRepository : PlanetCoreDataRepository = PlanetDataRepository()
    private let _planetApiRepository: PlanetApiResourceRepository = PlanetApiRepository()

    func getPlanetRecord(completionHandler:@escaping(_ result: Array<Planet>?)-> Void) {

        _cdPlanetDataRepository.getPlanetRecords { response in
            if(response != nil && response?.count != 0){
                // return response to the view controller
                completionHandler(response)

            }else {
                // call the api
                _planetApiRepository.getPlanetRecords { apiResponse in
                    if(apiResponse != nil && apiResponse?.count != 0){

                        // insert record in core data
                      _ = _cdPlanetDataRepository.batchInsertPlanetRecords(records: apiResponse!)
                        completionHandler(apiResponse)
                    }
                }
            }
        }

    }
}
