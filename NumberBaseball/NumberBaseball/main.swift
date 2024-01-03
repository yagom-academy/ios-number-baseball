//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var goalNumbers = [Int]()
var attemp = 9

func generateRandomNumbers() {
    for _ in 0...2 {
        let randomNumber = Int.random(in: 1...9)
        
        if goalNumbers.contains(randomNumber){
            
        } else {
            goalNumbers.append(randomNumber)
        }
        
    }
    print(goalNumbers)
}

generateRandomNumbers()
