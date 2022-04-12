    //
    //  Animal.swift
    //  ZooAnimal
    //
    //  Created by Konstantin Fomenkov on 12.04.2022.
    //

import Foundation

struct Animal: Codable {
    let name, latinName, animalType, activeTime: String
    let lengthMin, lengthMax, weightMin, weightMax: String
    let lifespan, habitat, diet, geoRange: String
    let imageLink: String
    let id: Int

    var description: String {
        """
    Name - \(name)
    Animal type - \(animalType)
    Latin name - \(latinName)
    Active time - \(activeTime), life span - \(lifespan) years
    Habitat - \(habitat)
    Diet - \(diet)
    Minimal length - \(lengthMin) ft., maximal length - \(lengthMax) ft.
    Minimal weight - \(weightMin) lbs., maximal weight - \(weightMax) lbs.
    Geolocations - \(geoRange)
    """
    }

    init(animalData: [String: Any]) {
        name = animalData["name"] as? String ?? ""
        latinName = animalData["latin_name"] as? String ?? ""
        animalType = animalData["animal_type"] as? String ?? ""
        activeTime = animalData["active_time"] as? String ?? ""
        lengthMin = animalData["length_min"] as? String ?? ""
        lengthMax = animalData["length_max"] as? String ?? ""
        weightMin = animalData["weight_min"] as? String ?? ""
        weightMax = animalData["weight_max"] as? String ?? ""
        lifespan = animalData["lifespan"] as? String ?? ""
        habitat = animalData["habitat"] as? String ?? ""
        diet = animalData["diet"] as? String ?? ""
        geoRange = animalData["geo_range"] as? String ?? ""
        imageLink = animalData["image_link"] as? String ?? ""
        id = animalData["id"] as? Int ?? 0
    }
}
