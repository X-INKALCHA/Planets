//
//  NetworkManager.swift
//  Planets
//
//  Created by SravsRamesh on 07/06/23.
//

import Foundation

enum NetworkError: Error {
    
    case urlError
    case networkError(String?)
    case parsingError
    case dataError
}


class NetworkManager{
    
    static let sharedManager = NetworkManager()
    private let ephimeralSession = URLSession (configuration: .ephemeral)
    private init() {}
    func requestWithNoCache<T: Decodable> (url: URL?, excepting: T.Type, completion: @escaping (Result<T, NetworkError>) -> ()) {
        guard let url = url
        else {
            completion(.failure(.urlError))
            return
        }
        ephimeralSession.dataTask(with: url) { data, response, error in
            
            if error != nil {
                completion( .failure(.networkError(error?.localizedDescription)))
            }
            guard let data = data
            else{
                completion(.failure(.dataError))
                return
            }
            let requestResponse = try? JSONDecoder().decode(T.self, from: data)
            if let requestResponse = requestResponse{
                completion( .success (requestResponse))
            }
            else{
                completion(.failure(.parsingError))
            }
            }.resume ()
        }
}

