//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []
var playerNumbers: [Int] = []

var remainingNumber: Int = 9

//enum BallCount: Int{
//    case strike
//    case ball
//}

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

func startGame() {
    computerNumbers = makeRandomNumbers()
    
    repeat {
        playerNumbers = makeRandomNumbers()
        print("임의의 수 :", playerNumbers)
        
        let result = calculateStrikesAndBalls(targetNumbers: computerNumbers, compareNumbers: playerNumbers)
        print(result.0, " 스트라이크,", result.1, " 볼")
        
        remainingNumber -= 1
        print("남은 기회 :", remainingNumber)
    } while remainingNumber > 0
}

startGame()
