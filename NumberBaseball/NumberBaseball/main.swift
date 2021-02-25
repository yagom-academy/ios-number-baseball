//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []
var playerNumbers: [Int] = []

var remainingNumber: Int = 9

func makeRandomNumbers () -> [Int] {
    var returnValue: [Int] = []
    var RandomNumber: Int
    repeat {
        RandomNumber = Int.random(in: 1...9)
        if !returnValue.contains(RandomNumber) {
            returnValue.append(RandomNumber)
        }
    } while returnValue.count < 3
    return returnValue
}

computerNumbers = makeRandomNumbers()

print(computerNumbers)
