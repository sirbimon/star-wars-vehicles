//
//  ViewController.swift
//  Star Wars Vehicles
//
//  Created by Bimonaretga on 5/28/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    func requestWith(url: String, completion: @escaping ((JSON?) -> ())) {
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

