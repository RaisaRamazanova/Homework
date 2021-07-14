//
//  Squats.swift
//  FactoryMethod
//
//  Created by Рамазанова Раисат on 14.07.2021.
//

import Foundation

class Squats: Exercise {
    var name: String = "Приседания"
    
    var type: String = "Упражнения для ног"
    
    func start() {
        print("Начинаем приседать")
    }
    
    func stop() {
        print("Заканчиваем приседать")
    }
}

