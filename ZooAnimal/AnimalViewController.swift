//
//  AnimalViewController.swift
//  ZooAnimal
//
//  Created by Konstantin Fomenkov on 13.04.2022.
//

import UIKit

class AnimalViewController: UIViewController {

    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalDescriptionLabel: UILabel!

    var animal: Animal!

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchImage(from: animal.imageLink) { data in
            self.animalImageView.image = UIImage(data: data)
        }
        animalDescriptionLabel.text = animal.description
    }
}
