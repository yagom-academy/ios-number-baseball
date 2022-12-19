//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let computerNumberArray: [Int]
var numberOfTry = 9
func makeRandomNumberArray() -> [Int] {
    var setNumber: Set<Int> = Set<Int>()
    while setNumber.count != 3 {
        setNumber.insert(Int.random(in: 1...9))
    }
    return Array(setNumber)
}
func countBallStrike(computerArray: [Int], numberArray: [Int]) -> (Int, Int) {
    var countStrike = 0
    var countBall = 0
    for index in 0..<3 {
        guard let findIndex = numberArray.firstIndex(of: computerArray[index]) else {
            continue
        }
        if index == findIndex {
            countStrike += 1
        } else {
            countBall += 1
        }
    }
    return (countStrike, countBall)
}
computerNumberArray = makeRandomNumberArray()
while numberOfTry != 0 {
    let randomNumberArray
}
