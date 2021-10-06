//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomNumber: Set<Int> = []

func chooseRandomNumber() {
    var number = Int.random(in: 1...9)
    randomNumber.insert(number)
}

while randomNumber.count < 3 {
    chooseRandomNumber()
}

func compareResult(with userNumbers: [Int]) -> [Int] {
    let randomNumbers = Array(randomNumber)
    var ballCount: Int = 0
    var strikeCount: Int = 0
    for index in 0...(userNumbers.count - 1) {
        ballCount += randomNumbers.contains(userNumbers[index]) ? 1 : 0
    }
    for index in 0...(userNumbers.count - 1) {
        strikeCount += randomNumbers[index] == userNumbers[index] ? 1 : 0
    }
    ballCount -= strikeCount
    return [ballCount, strikeCount]
}
