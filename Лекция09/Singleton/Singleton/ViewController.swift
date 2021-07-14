//
//  ViewController.swift
//  Singleton
//
//  Created by Дмитрий Рудановский on 12.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Animal.cat.name)
        Animal.cat.name = "Peter"
        print(Animal.cat.name)
        
    }


}

