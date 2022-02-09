//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func randomInt(to: Int, from: Int) -> Int { Int.random(in: to...from) }

func makeNonOverlappingNumber() -> Set<Int> {
    var nonOverlappingNumber: Set<Int> = Set<Int>()
    while nonOverlappingNumber.count < 3 {
        nonOverlappingNumber.insert(randomInt(to: 1, from: 9))
    }
    return nonOverlappingNumber
}

func checkScore(answerNumber: [Int], playerNumber: [Int]) -> (Int, Int) {
    var ballScore: Int = 0
    var strikeScore: Int = 0
    var checkBallNumber: [Int] = []
    for i in 0...answerNumber.count - 1 {
        if answerNumber == playerNumber {
            strikeScore = 3
            return (strikeScore, ballScore)
        }
        if answerNumber[i] == playerNumber[i] {
            strikeScore += 1
        } else {
            checkBallNumber.append(playerNumber[i])
        }
    }
    for i in checkBallNumber {
        if answerNumber.contains(i) {
            ballScore += 1
        }
    }
    return (strikeScore, ballScore)
}

func startGame(answerNumber: [Int]) {
    var gameCount: Int = 9
    while gameCount > 0 {
        var playerNumber = Array(makeNonOverlappingNumber())
        checkScore(answerNumber: answerNumber, playerNumber: playerNumber)
        gameCount -= 1
    }
}

var answerNumber: [Int] = Array(makeNonOverlappingNumber())
//var gameCount: Int = 9

startGame(answerNumber: answerNumber)
