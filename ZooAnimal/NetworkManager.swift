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

    private let url = "https://zoo-animal-api.herokuapp.com/animals/rand/10"

    private init() {}

    func fetchData(complition: @escaping(Result<[Animal],NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { responseData in
                switch responseData.result {
                case .success(let value):
                    guard let animalData = value as? [[String: Any]] else { return }
                    let animals = Animal.getAnimals(from: animalData)
                    print(animals.description)
                    complition(.success(animals))
                case .failure(let error):
                    print(error)
                    complition(.failure(.decodingError))
                }
            }
    }

    func fetchImage(from url: String?, with completion: @escaping(Data) -> Void) {
        guard let stringURL = url else { return }
        guard let imageURL = URL(string: stringURL) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
