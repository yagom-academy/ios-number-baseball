//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computer: [Int] = []
var remaining = 9
var numbers = Array(1...9)

func generateNumber() {
    for _ in 0...2 {
        let number = arc4random_uniform(UInt32(numbers.count))
        computer.append(numbers[Int(number)])
        numbers.remove(at: Int(number))
    }
    print(computer)
}

for _ in 0...4 {
    generateNumber()
    computer = []
}
