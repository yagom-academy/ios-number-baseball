//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []
var remaining = 9
var remainingNumbers = Array(1...9)

func generateNumber() {
    while computerNumbers.count < 3 {
        let number = Int(arc4random_uniform(UInt32(remainingNumbers.count)))
        var selectedNumber = remainingNumbers[number]
        if selectedNumber != 0 {
            computerNumbers.append(selectedNumber)
        }
        remainingNumbers[number] = 0
    }
    print(computerNumbers)
}

func getUserBall() -> [Int?] {
    let userNumberList = readLine()?.split(separator: " ").map({ number in
        return Int(number)
    })
    return  userNumberList ?? []
}

func compareNumbers() {
    let userNumbers = getUserBall()
    var strike = 0
    var ball = 0
    for (idx, computerNum) in computerNumbers.enumerated() {
        if computerNum == userNumbers[idx] {
            strike += 1
        } else {
            ball += 1
        }
    }
    print("\(strike),\(ball)")
}


generateNumber()
getUserBall()
compareNumbers()
