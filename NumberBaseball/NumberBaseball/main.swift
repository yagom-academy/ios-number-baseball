//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func runNumberGame() {
    let lifeCount = 999
    let generatedCorrectNumbers = generatedThreeRandomNumbers()
    var userTryNumbers: [Int]
    var threeStrikeFlag = false
    
    for attemptCount in 1...lifeCount where threeStrikeFlag == false {
        userTryNumbers = generatedThreeRandomNumbers()
        
        let (strikeCount, ballCount) = computeStrikeAndBall(generatedCorrectNumbers: generatedCorrectNumbers, userTryNumbers: userTryNumbers)
        
        print("임의의 수: \(userTryNumbers[0]) \(userTryNumbers[1]) \(userTryNumbers[2])")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        threeStrikeFlag = isThreeStrike(strikeCount: strikeCount)
        
        printAttemptCount(lifeCount: lifeCount, attemptCount: attemptCount, threeStrikeFlag: threeStrikeFlag)
    }

    if threeStrikeFlag == true {
        print("사용자 승리...!")
    } else {
        print("컴퓨터 승리...!")
    }
}

func printAttemptCount(lifeCount: Int, attemptCount: Int, threeStrikeFlag: Bool) {
    if threeStrikeFlag == true {
        return
    } else {
        print("남은 기회: \(lifeCount-attemptCount)")
    }
}

func isThreeStrike(strikeCount: Int) -> Bool {
    if strikeCount == 3 {
        return true
    } else {
        return false
    }
}

func generatedThreeRandomNumbers() -> [Int] {
    var randomNumbers: [Int]
    var deduplicatedNumbers: Set<Int>
    
    repeat {
        randomNumbers = [Int.random(in: 1...9), Int.random(in: 1...9), Int.random(in: 1...9)]
        
        deduplicatedNumbers = Set(randomNumbers)
        
    } while randomNumbers.count != deduplicatedNumbers.count
    
    return randomNumbers
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

runNumberGame()
