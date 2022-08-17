//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let numbers = [Int]()
var times = 9

func generateNumbers() -> [Int] {
    return Array((1...9).shuffled()[..<3])
}

print(generateNumbers())

func showGameResult() {
    var strike = 0
    var ball = 0
    let myNumbers = readLine()?.split(separator: " ").map { Int($0) }
    for number, myNumber in zip(numbers, myNumbers) {
        if numbers == myNumbers {
            strike += 1
        } else {
            if numbers.contains(myNumber) {
                ball += 1
            }
        }
    }
}
