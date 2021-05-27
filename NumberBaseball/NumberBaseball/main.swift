//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateRandomNumber() -> [Int] {
    var numbers: [Int] = []
    
    while numbers.count < 3 {
        let number = Int.random(in: 1...9)
        if !numbers.contains(number) {
            numbers.append(number)
        }
    }
    return numbers
}
