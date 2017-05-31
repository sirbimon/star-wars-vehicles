//
//  ViewController.swift
//  Star Wars Vehicles
//
//  Created by Bimonaretga on 5/28/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var vehicle: Vehicle? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        assignVehicle()
        
    }

}

extension ViewController {
    
    func assignVehicle() {
        let endpoint = "https://swapi.co/api/vehicles/4"
        requestVehicle(stringUrl: endpoint) { (vehicle) in
            self.vehicle = vehicle
        }
    }
    
    func requestVehicle(stringUrl: String, completion: @escaping (Vehicle) -> Void) {
        APIManager.requestWith(url: stringUrl) { (json) in
            guard let unwrappedJson = json else { return }
            let newVehicle = Vehicle(json: unwrappedJson)
            guard let unwrappedVehicle = newVehicle else { return }
            completion(unwrappedVehicle)
        }
    }

}

struct Vehicle {
    let name: String
    
    init?(json: JSON) {
        let name = json["name"] as? String
        guard let unwrappedName = name else { return nil }
        self.name = unwrappedName
    }
}

class APIManager {
    class func requestWith(url: String, completion: @escaping ((JSON?) -> ())) {
        guard let validURL = URL(string: url) else { print(#function, "The url was not valid"); return }
        let dataTask = URLSession.shared
        dataTask.dataTask(with: validURL) { (dataResult, response, error) in
            guard let unwrappedData = dataResult else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? JSON
                completion(json)
            } catch {
                print("jsonserialization failed")
            }
        }.resume()
    }
}

typealias JSON = [String: Any]

