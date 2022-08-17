//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: Array<Int> = []
var gameCounter: Int = 9
var userNumbers: Array<Int> = []

func makeThreeNumbers() -> Array<Int> {
    var generatedNumbers: Set<Int> = []
    while generatedNumbers.count < 3 {
        generatedNumbers.update(with: Int.random(in: 1...9))
    }
    return generatedNumbers.map { $0 }
}

func gameStart() {
    var strikeCounter: Int = 0
    var ballCounter: Int = 0
    gameCounter -= 1
    print("임의의 수 : \(userNumbers.map { String($0) }.joined(separator: " "))")
    computerNumbers.enumerated().forEach { (index,computerNumber) in
        if userNumbers[index] == computerNumber {
            strikeCounter += 1
        } else if userNumbers.contains(computerNumber) {
            ballCounter += 1
        }
    }
    print("\(strikeCounter) 스트라이크, \(ballCounter) 볼")
    if gameCounter < 1 {
        print("컴퓨터 승리...!")
        return
    } else {
    print("남은 기회 : \(gameCounter)")
    }
}

computerNumbers = makeThreeNumbers()
userNumbers = makeThreeNumbers()
gameStart()
userNumbers = makeThreeNumbers()
gameStart()
userNumbers = makeThreeNumbers()
gameStart()
userNumbers = makeThreeNumbers()
gameStart()
userNumbers = makeThreeNumbers()
gameStart()
userNumbers = makeThreeNumbers()
gameStart()
userNumbers = makeThreeNumbers()
gameStart()
userNumbers = makeThreeNumbers()
gameStart()
userNumbers = makeThreeNumbers()
gameStart()
