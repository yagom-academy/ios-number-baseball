//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomTargetNums: [Int] = generateUniqueRandomNums(start: 1, end: 9)
var randomPlayerNums: [Int] = [Int]()

var remainedCounts = 9
var strikeCount = 0
var ballCount = 0

func countStrikeAndBall(index: Int) {
    if randomTargetNums[index] == randomPlayerNums[index] {
        strikeCount += 1
    } else if randomTargetNums.contains(randomPlayerNums[index]) {
        ballCount += 1
    }
}

func readStrikeAndBall() {
    for time in 0..<randomTargetNums.count {
        countStrikeAndBall(index: time)
    }
}

func printStrikeAndBall() {
    print("\(strikeCount) 스트라이크 \(ballCount) 볼")
}

func generateUniqueRandomNums(start: Int, end: Int) -> [Int] {
    var randomNums = [Int]()
    
    while randomNums.count < 3 {
        let num = Int.random(in: start...end)
        guard !randomNums.contains(num) else {
            continue
        }
        randomNums.append(num)
    }
    
    return randomNums
}

func presentPlayerNums() {
    randomPlayerNums = generateUniqueRandomNums(start: 1, end: 9)
    print("임의의 수 : \(randomPlayerNums[0]) \(randomPlayerNums[1]) \(randomPlayerNums[2])")
}

func gameResult() {
    if strikeCount == 3 {
        print("플레이어 승리...!")
    } else if remainedCounts == 0 {
        print("컴퓨터 승리...!")
    }
}

func endRound() {
    remainedCounts -= 1
    print("남은 기회 : \(remainedCounts)")
}

func resetStrikeBallCounts() {
    strikeCount = 0
    ballCount = 0
}

func playBaseballGame() {
    repeat {
        resetStrikeBallCounts()
        presentPlayerNums()
        readStrikeAndBall()
        printStrikeAndBall()
        endRound()
        gameResult()
    } while remainedCounts > 0 && strikeCount < 3
}

playBaseballGame()

