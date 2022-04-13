    //
    //  AnimalsTableViewController.swift
    //  ZooAnimal
    //
    //  Created by Konstantin Fomenkov on 13.04.2022.
    //

import UIKit

class AnimalsTableViewController: UITableViewController {

    var animals: [Animal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        fetchAnimals()
        tableView.reloadData()
    }

        // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        let animal = animals[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = "Animal: \(animal.name)"
        content.secondaryText = "Latin name: \(animal.latinName)"
        NetworkManager.shared.fetchImage(from: animal.imageLink) { data in
                content.image = UIImage(data: data)
            }
        cell.contentConfiguration = content

        return cell
    }


     // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let animalVC = segue.destination as? AnimalViewController else { return }
         guard let indexPath = tableView.indexPathForSelectedRow else { return }
         animalVC.animal = animals[indexPath.row]
     }

    func fetchAnimals() {
        NetworkManager.shared.fetchData() { result in
            switch result {
            case .success(let animals):
                self.animals = animals
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
