//
//  ViewController.swift
//  ZooAnimal
//
//  Created by Konstantin Fomenkov on 12.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchData { result in
        }
        // Do any additional setup after loading the view.
    }


}

