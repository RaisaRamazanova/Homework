//
//  ViewController.swift
//  FactoryMethod
//
//  Created by Рамазанова Раисат on 14.07.2021.
//

import UIKit

class ViewController: UIViewController {

    var exerciseArray = [Exercise]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createExercise(exname: .jumping)
        sport()
    }

    func createExercise(exname: Exercises) {
        let newExercise = FactoryExercise.defaulteFactory.createExercise(name: exname)
        exerciseArray.append(newExercise)
    }
    
    func sport() {
        for ex in exerciseArray {
            ex.start()
            ex.stop()
        }
    }
}

