//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomComputerNumbers: [Int] = []
var remainsChance = 9

func generateRandomNumbers() -> [Int] {
    var numbers = [Int]()
    while numbers.count < 3 {
        let randomNumber = Int.random(in:1...9)
        if numbers.contains(randomNumber) == false {
            numbers.append(randomNumber)
        }
    }
    return numbers
}
