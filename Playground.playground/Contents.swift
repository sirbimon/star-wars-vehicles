//: Playground - noun: a place where people can play

import UIKit
import Foundation

typealias JSON = [String: Any]

func requestWith(url: String) {
    guard let validURL = URL(string: url) else { print(#function, "The url was not valid"); return }
    let dataTask = URLSession.shared
    dataTask.dataTask(with: validURL) { (dataResult, response, error) in
        print(dataResult)
        
        }.resume()
    
}

requestWith(url: "https://swapi.co/api/people")

