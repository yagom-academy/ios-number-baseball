//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


func createRandomNumbers(range: ClosedRange<Int> = (1...9), count: Int = 3) -> [Int] {
    let shuffledNumbers = [Int](range).shuffled()
    let extractedNumbers = [Int](shuffledNumbers[0..<count])
    return extractedNumbers
}

func sumUpScores(secretNumbers: [Int], triedNumbers: [Int]) -> (Int, Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for index in 0..<secretNumbers.count {
        let matchIndex = secretNumbers.firstIndex(of: triedNumbers[index])
        if matchIndex == nil {
            continue
        } else if matchIndex == index {
            strikeCount += 1
        } else {
            ballCount += 1
        }
    }
    return (strikeCount, ballCount)
}

var randomAnswerNumbers = createRandomNumbers()
var gameCount = 9

func printVictoryMessage(gameChance gameCount: Int, strikeScore strikeCount: Int) {
    if gameCount == 0 && strikeCount < 3 {
        print("컴퓨터 승리…!")
    } else if strikeCount == 3 {
        print("사용자 승리!")
    }
}

func startGame() {
    while gameCount > 0 {
        gameCount -= 1
        let userNumbers = createRandomNumbers()
        let (strikeCount, ballCount) = sumUpScores(secretNumbers: randomAnswerNumbers, triedNumbers: userNumbers)
        
        print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회 : \(gameCount)")
        
        printVictoryMessage(gameChance: gameCount, strikeScore: strikeCount)
    }
}

startGame()
