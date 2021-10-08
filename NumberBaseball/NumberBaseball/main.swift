//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var targetNumbers: [Int] = []
var randomNumbers: [Int] = []
var tryCount = 9
var isUserWin = false

func playNumberBaseballGame() {
    while tryCount > 0 && isUserWin == false {
        let strikeCount = playRound()
        
        isUserWin = isThreeStrike(count: strikeCount)
        printTryCount()
    }
    printWinner()
}

func playRound() -> Int {
    let randomNumbers = createRandomNumbers()
    printRandomNumbers(numbers: randomNumbers)
    
    let score = compare(randomNumbers, with: targetNumbers)
    printStrikeAndBall(score: score)
    
    return score.strike
}

func createRandomNumbers(range: ClosedRange<Int> = 1...9, count: Int = 3) -> [Int] {
    var resultNumbers: Set<Int> = []
    
    repeat {
        let randomNumber: Int = Int.random(in: range)
        
        resultNumbers.insert(randomNumber)
    } while resultNumbers.count < count
    
    return resultNumbers.shuffled()
}

func printRandomNumbers(numbers: [Int]) {
    print("임의의 수 : ", terminator: "")
    print(convertIntArrayToString(numbers))
}

func convertIntArrayToString(_ array: [Int]) -> String {
    let resultString: String = array.map { String($0) }.joined(separator: " ")
    
    return resultString
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

func printStrikeAndBall(score: (strike: Int, ball: Int)) {
    print("\(score.strike) 스트라이크, \(score.ball) 볼")
}

func printWinner() {
    if isUserWin {
        print("사용자 승리!")
    } else {
        print("컴퓨터 승리...!")
    }
}

func printTryCount() {
    if isUserWin == false {
        tryCount = tryCount - 1
        print("남은 기회 : \(tryCount)")
    }
}

func isThreeStrike(count: Int) -> Bool {
    return count == 3
}

targetNumbers = createRandomNumbers()
playNumberBaseballGame()
