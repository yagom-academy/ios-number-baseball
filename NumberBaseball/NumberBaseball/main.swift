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

func calculateStrikesAndBalls(targetNumbers: [Int], compareNumbers: [Int]) -> (Int, Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for (index, element) in compareNumbers.enumerated() {
        if targetNumbers.contains(element) {
            if targetNumbers[index] == compareNumbers[index] {
                strikeCount += 1
            }
            else {
                ballCount += 1
            }
        }
    }
    return (strikeCount, ballCount)
}

calculateStrikesAndBalls(targetNumbers: computerNumbers, compareNumbers: [1, 2, 3])


