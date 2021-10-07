//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var targetNumbers: [Int] = []
var randomNumbers: [Int] = []
var tryCount = 9

func convertIntArrayToString(_ array: [Int]) -> String {
    let resultString: String = array.map { String($0) }.joined(separator: " ")
    
    return resultString
}

func createRandomNumbers(range: ClosedRange<Int> = 1...9, count: Int = 3) -> [Int] {
    var resultNumbers: Set<Int> = []
    
    repeat {
        let randomNumber: Int = Int.random(in: range)
        
        resultNumbers.insert(randomNumber)
    } while resultNumbers.count < count
    
    return resultNumbers.shuffled()
}

targetNumbers = createRandomNumbers()

func playRound() -> Int {
    print("임의의 수 : ", terminator: "")
    let randomNumbers = createRandomNumbers()
    
    print(convertIntArrayToString(randomNumbers))
    
    let score = compare(randomNumbers, with: targetNumbers)
    printStrikeAndBall(score: score)
    
    return score.strike
}

func printStrikeAndBall(score: (strike: Int, ball: Int)) {
    print("\(score.strike) 스트라이크, \(score.ball) 볼")
}

func compare(_ randomNumbers: [Int], with targetNumbers: [Int]) -> (strike: Int, ball: Int) {
    var score: (strike: Int, ball: Int) = (0, 0)
    
    for i in randomNumbers.indices {
        if randomNumbers[i] == targetNumbers[i] {
            score.strike += 1
        } else if targetNumbers.contains(randomNumbers[i]) && targetNumbers[i] != randomNumbers[i] {
            score.ball += 1
        }
    }
    
    return score
}

func playGame(tryCount: Int) {
    for currentTryCount in 1...tryCount {
        let gameScore = playRound()
        
        printGameResult(score: gameScore, currentTryCount: currentTryCount, tryCount: tryCount)
    }
}

func printGameResult(score: Int, currentTryCount: Int, tryCount: Int) {
    let isWin = (score == 3)
    let remainCount = tryCount - currentTryCount
    
    if isWin {
        print("사용자 승리!")
        return
    } else if currentTryCount == tryCount {
        print("남은 기회 : \(remainCount)")
        print("컴퓨터 승리...!")
    }
}
