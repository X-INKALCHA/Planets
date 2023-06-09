

import Foundation

struct PlanetResponse: Decodable {
    let planets: [Planet]?
    
    enum CodingKeys: String, CodingKey {
        case planets = "results"
    }
}

struct Planet: Decodable {
    let name: String
}
