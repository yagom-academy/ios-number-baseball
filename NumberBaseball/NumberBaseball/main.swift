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
    
    return Array(resultNumbers)
}

targetNumbers = createRandomNumbers()

func playRound() -> Int {
    print("임의의 수 : ", terminator: "")
    let randomNumbers = createRandomNumbers()
    
    print(convertIntArrayToString(randomNumbers))
    
    let score: (strike: Int, ball: Int) = compareScore(by: randomNumbers)
    printStrikeAndBall(score: score)
    
    return score.strike
}

func printStrikeAndBall(score: (strike: Int, ball: Int)) {
    print("\(score.strike) 스트라이크, \(score.ball) 볼")
}

func compareScore(by randomNumbers: [Int], targetNumbers: [Int] = targetNumbers) -> (Int, Int) {
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

for currentTryCount in 1...9 {
    let gameScore = playRound()
    let isWin: Bool = gameScore == 3
    
    if isWin {
        print("사용자 승리!")
        break
    } else if currentTryCount == 9 {
        print("남은 기회 : \(tryCount - currentTryCount)")
        print("컴퓨터 승리...!")
    }
}
