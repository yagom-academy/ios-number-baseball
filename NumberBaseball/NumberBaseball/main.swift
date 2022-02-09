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

func checkScore(answerNumber: [Int], playerNumber: [Int]) {
    var ballScore: Int = 0
    var strikeScore: Int = 0
    
    for i in 0...answerNumber.count - 1 {
        if answerNumber[i] == playerNumber[i] {
            strikeScore += 1
        } else if answerNumber.contains(playerNumber[i]) {
            ballScore += 1
        }
    }
    print("\n\(strikeScore) 스트라이트, \(ballScore) 볼")
}

func startGame() {
    let computerNumbers: [Int] = Array(makeNonOverlappingNumber())
    var gameCount: Int = 9

    while true {
        let playerNumbers = Array(makeNonOverlappingNumber())
        if gameCount == 0 {
            print("컴퓨터 승리...!")
            break
        } else if computerNumbers != playerNumbers {
            gameCount -= 1
            checkScore(answerNumber: computerNumbers, playerNumber: playerNumbers)
            print("임의의 수 : ", terminator: "")
            playerNumbers.forEach{ print($0, terminator: " ") }
            print("\n남은 게임 횟수 : \(gameCount)")
        } else {
            print("3 스트라이크, 0 볼\n사용자 승리!")
            break
        }
    }
}
startGame()
