//
//  Jumping.swift
//  FactoryMethod
//
//  Created by Рамазанова Раисат on 14.07.2021.
//

import Foundation

class Jumping: Exercise {
    var name: String = "Прыжки"
    
    var type: String = "Упражнения для ног"
    
    func start() {
        print("Начинаем прыгать")
    }
    
    func stop() {
        print("Заканчиваем прыгать")
    }
}
