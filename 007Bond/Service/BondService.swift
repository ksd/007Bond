//
//  BondService.swift
//  007Bond
//
//  Created by ksd on 24/11/2022.
//

import Foundation

class BondService {
    
    var listOfBonds: [Bond] = {
        let url = Bundle.main.url(forResource: "bond", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try! decoder.decode([Bond].self, from: data)
    }()
    
}
