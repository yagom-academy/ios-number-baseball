//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computer: [Int] = []
var remaining = 9
var remainingNumbers = Array(1...9)

func generateNumber() {
    while computer.count < 3 {
        let number = Int(arc4random_uniform(UInt32(remainingNumbers.count)))
        var selectedNumber = remainingNumbers[number]
        if selectedNumber != 0 {
            computer.append(selectedNumber)
        }
        remainingNumbers[number] = 0
    }
    print(computer)
}

func getUserBall() {
    let userNumberList = readLine()?.split(separator: " ").map({ number in
        return Int(number)
    })
}
