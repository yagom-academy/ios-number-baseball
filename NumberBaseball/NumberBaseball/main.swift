//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomNumbers: [Int] = []
var tryCount: Int = 9

func getRandomNumber() -> [Int] {
    
    var randomNumbers: [Int] = []
    
    while randomNumbers.count != 3 {
        
        let randomNumber = Int.random(in: 1...9)
        
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    
    return randomNumbers
}
