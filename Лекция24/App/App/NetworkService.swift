//
//  NetworkService.swift
//  App
//
//  Created by Раисат Рамазанова on 22.08.2021.
//

import Foundation
import UIKit


class NetworkService {
    
    let session: URLSession

    init() {
        session = URLSession(configuration: .default)
    }
    
    
    // MARK:- Первое задание
    
    ///  Вот здесь должны загружаться 4 картинки и совмещаться в одну.
    ///  Для выполнения этой задачи вам можно изменять только этот метод.
    ///  Метод, соединяющий картинки в одну, уже написан (вызывается в конце).
    ///  Ответ передайте в completion.
    ///  Помните, что надо сделать так, чтобы метод работал как можно быстрее.
    public func loadPuzzle(completion: @escaping (Result<UIImage, Error>) -> ()) {
        // это адреса картинок. они работающие, всё ок!
        let firstURL = URL(string: "https://storage.googleapis.com/ios_school/tu.png")!
        let secondURL = URL(string: "https://storage.googleapis.com/ios_school/pik.png")!
        let thirdURL = URL(string: "https://storage.googleapis.com/ios_school/cm.jpg")!
        let fourthURL = URL(string: "https://storage.googleapis.com/ios_school/apple.jpeg")!
        let urls = [firstURL, secondURL, thirdURL, fourthURL]
        
        // в этот массив запишите итоговые картинки

        var results = [UIImage]()
        let group = DispatchGroup()
        group.enter()
        for oneUrl in urls {
            var image = UIImage()
            if let data = try? Data(contentsOf: oneUrl) {
                DispatchQueue.main.async {
                    image = UIImage(data: data)!
                    results.append(image)
                }
            }
        }
        group.leave()
        
//        Соедините картинки в одну с помощью
        
        group.notify(queue: .main) {
            if let merged = ImagesServices.image(byCombining: results) {
                    completion(.success(merged))
            }
        }

    }
    
    // MARK:- Второе задание
    
    ///  Здесь задание такое:
    ///  У вас есть keyURL, который приведёт вас к ссылке на клад.
    ///  Верните картинку с этим кладом в completion
    public func loadQuiz(completion: @escaping(Result<UIImage, Error>) -> ()) {
        let keyURL = URL(string: "https://sberschool-c264c.firebaseio.com/enigma.json?avvrdd_token=AIzaSyDqbtGbRFETl2NjHgdxeOGj6UyS3bDiO-Y")!
        if let data = try? Data(contentsOf: keyURL) {
            let string = String(data: data, encoding: .utf8)!
            let str = string.replacingOccurrences(of: "\"", with: "")
            if let url = URL(string: str) {
                DispatchQueue.global().async {
                    if let datas = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            if let image = UIImage(data: datas) {
                                completion(.success(image))
                            }
                        }
                    }
                }
            } else {print("could not open url, it was nil")}
        }
    }
}
