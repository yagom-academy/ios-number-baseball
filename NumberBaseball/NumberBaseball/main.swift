//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func runNumberGame() {
    let lifeCount = 9
    let generatedCorrectNumbers = generatedThreeRandomNumbers()
    var userTryNumbers: [Int]
    
    for attemptCount in 1...lifeCount {
        userTryNumbers = generatedThreeRandomNumbers()
        
        let (strikeCount, ballCount) = computeStrikeAndBall(generatedCorrectNumbers: generatedCorrectNumbers, userTryNumbers: userTryNumbers)
        
        print("임의의 수: \(userTryNumbers[0]) \(userTryNumbers[1]) \(userTryNumbers[2])")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        if strikeCount == 3 {
            print("사용자 승리...!")
            return
        }
        print("남은 기회: \(lifeCount-attemptCount)")
    }
    print("컴퓨터 승리...!")
}

func generatedThreeRandomNumbers() -> [Int] {
    var randomNumbers: [Int]
    
    while true {
        randomNumbers = [Int.random(in: 1...9), Int.random(in: 1...9), Int.random(in: 1...9)]
        
        let deduplicatedNumbers = Set(randomNumbers)
        
        if randomNumbers.count == deduplicatedNumbers.count {
            return randomNumbers
        }
    }
}

func computeStrikeAndBall(generatedCorrectNumbers: [Int], userTryNumbers: [Int]) -> (Int, Int) {
    var strikeCount = 0
    var ballCount = 0
    
    for indexOfUserTryNumbers in 0..<userTryNumbers.count {
        if userTryNumbers[indexOfUserTryNumbers] == generatedCorrectNumbers[indexOfUserTryNumbers] {
            strikeCount += 1
        } else if generatedCorrectNumbers.contains(userTryNumbers[indexOfUserTryNumbers]) {
            ballCount += 1
        }
    }
    return (strikeCount, ballCount)
}
