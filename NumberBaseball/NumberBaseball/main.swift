//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let digitsOfGame = 3

var randomTargetNums: [Int] = generateUniqueRandomNums(from: 1, to: 9)
var randomPlayerNums: [Int] = [Int]()

var remainedRounds = 9
var strikeCounts = 0
var ballCounts = 0

func judgeStrikeAndBall(at: Int) {
    if randomTargetNums[at] == randomPlayerNums[at] {
        strikeCounts += 1
    } else if Set(randomTargetNums).contains(randomPlayerNums[at]) {
        ballCounts += 1
    }
}

func countStrikeAndBall() {
    for order in 0..<digitsOfGame {
        judgeStrikeAndBall(at: order)
    }
}

func printStrikeAndBall() {
    print("\(strikeCounts) 스트라이크 \(ballCounts) 볼")
}

func generateUniqueRandomNums(from: Int, to: Int) -> [Int] {
    var uniqueRandomNums = [Int]()
    
    while uniqueRandomNums.count < digitsOfGame {
        let num = Int.random(in: from...to)
        guard !uniqueRandomNums.contains(num) else {
            continue
        }
        uniqueRandomNums.append(num)
    }
    
    return uniqueRandomNums
}

func presentPlayerNums() {
    randomPlayerNums = generateUniqueRandomNums(from: 1, to: 9)
    print("임의의 수 : ", terminator: "")
    for i in 0..<digitsOfGame {
        print(randomPlayerNums[i], terminator: " ")
    }
    print("")
}

func gameResult() {
    if strikeCounts == digitsOfGame {
        print("플레이어 승리...!")
    } else if remainedRounds == 0 {
        print("컴퓨터 승리...!")
    }
}

func presentRounds() {
    remainedRounds -= 1
    print("남은 기회 : \(remainedRounds)")
}

func resetStrikeAndBallCounts() {
    strikeCounts = 0
    ballCounts = 0
}

func playBaseballGame() {
    repeat {
        resetStrikeAndBallCounts()
        presentPlayerNums()
        countStrikeAndBall()
        printStrikeAndBall()
        presentRounds()
        gameResult()
    } while remainedRounds > 0 && strikeCounts < digitsOfGame
}

playBaseballGame()

