//
//  NetworkManager.swift
//  ZooAnimal
//
//  Created by Konstantin Fomenkov on 12.04.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()

    private let url = "https://zoo-animal-api.herokuapp.com/animals/rand"

    private init() {}

    func fetchData(complition: @escaping(Result<Animal,NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { responseData in
                switch responseData.result {
                case .success(let value):
                    guard let animalData = value as? [String: Any] else { return }
                    let animal = Animal(animalData: animalData)
                    print(animal.description)
                    complition(.success(animal))
                case .failure(let error):
                    print(error)
                }
            }
    }
}
