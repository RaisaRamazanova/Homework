//
//  FactoryExercise.swift
//  FactoryMethod
//
//  Created by Рамазанова Раисат on 14.07.2021.
//

import Foundation

enum Exercises {
    case jumping
    case squats
}

class FactoryExercise {
    static let defaulteFactory = FactoryExercise()
    
    func createExercise(name: Exercises) -> Exercise {
        switch name {
            case .jumping: return Jumping()
            case .squats: return Squats()
        }
    }
}
