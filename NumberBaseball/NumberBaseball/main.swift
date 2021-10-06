//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var targetNumbers: [Int] = []

var strikeCount: Int = 0
var ballCount: Int = 0

var tryCount: Int = 9

var randomNumbers: [Int] = []

func convertIntArrayToString(_ array: [Int]) -> String {
    let resultString: String = array.map { String($0) }.joined(separator: " ")
    
    return resultString
}

func createRandomNumbers(first: Int = 1, last: Int = 9, count: Int = 3) -> [Int] {
    var resultNumbers: [Int] = []
    
    repeat {
        let num: Int = Int.random(in: first...last)
        
        if !resultNumbers.contains(num) {
            resultNumbers.append(num)
        }
    } while resultNumbers.count < count
    
    return resultNumbers
}

targetNumbers = createRandomNumbers()

func playGameResult() -> (Int, Int) {
    print("임의의 수 : ", terminator: "")
    let randomNumbers = createRandomNumbers()
    
    print(convertIntArrayToString(randomNumbers))
    
    let score: (strike: Int, ball: Int) = compareScore(by: randomNumbers)
    print("\(score.strike) 스트라이크, \(score.ball) 볼")
    
    return score
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

print("타겟 숫자 : \(targetNumbers)")
for currentTryCount in 1...9 {
    let gameScore: (strike: Int, ball: Int) = playGameResult()
    let isWin: Bool = gameScore.strike == 3
    
    if isWin {
        print("사용자 승리!")
        break
    } else if currentTryCount == 9 {
        print("남은 기회 : \(tryCount - currentTryCount)")
        print("컴퓨터 승리...!")
    }
}
