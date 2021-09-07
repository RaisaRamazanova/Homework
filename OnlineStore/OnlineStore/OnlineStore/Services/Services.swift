//
//  Services.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 31.08.2021.
//

import Foundation

protocol JsonServiceProtocol {
    func getJsons(completion: @escaping (_ success: Bool, _ results: [JsonData]?, _ error: String?) -> ())
}

class JsonService: JsonServiceProtocol {
    // MARK: - functions
    
    func getJsons(completion: @escaping (Bool, [JsonData]?, String?) -> ()) {
        HttpRequestHelper().GET(url: "https://raw.githubusercontent.com/RaisaRamazanova/TestPryaniky/main/Contents.json", params: ["": ""], httpHeader: .application_json) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode([JsonData].self, from: data!)
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse Employees to model")
                }
            } else {
                completion(false, nil, "Error: Employees GET Request failed")
            }
        }
    }
}
