//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func runNumberGame() {
    let numLife = 9
    let keyNumbers = generateThreeRandomNumbers()
    var userTryNumbers: [Int]
    
    for numAttempt in 1...numLife {
        userTryNumbers = generateThreeRandomNumbers()
        
        let (numStrike, numBall) = computeStrikeAndBall(keyNumbers: keyNumbers, userTryNumbers: userTryNumbers)
        
        print("임의의 수: \(keyNumbers[0]) \(keyNumbers[1]) \(keyNumbers[2])")
        print("임의의 수: \(userTryNumbers[0]) \(userTryNumbers[1]) \(userTryNumbers[2])")
        print("\(numStrike) 스트라이크, \(numBall) 볼")
        
        if numStrike == 3 {
            print("사용자 승리...!")
            return
        }
        print("남은 기회: \(numLife-numAttempt)")
    }
    print("컴퓨터 승리...!")
}

func generateThreeRandomNumbers() -> [Int] {
    var randomNumbers: [Int]
    
    while true {
        randomNumbers = [Int.random(in: 1...9), Int.random(in: 1...9), Int.random(in: 1...9)]
        
        let deduplicatedNumbers = Set(randomNumbers)
        
        if randomNumbers.count == deduplicatedNumbers.count {
            return randomNumbers
        }
    }
}

func computeStrikeAndBall(keyNumbers: [Int], userTryNumbers: [Int]) -> (Int, Int) {
    var numStrike = 0
    var numBall = 0
    
    for idx in 0..<userTryNumbers.count {
        if userTryNumbers[idx] == keyNumbers[idx] {
            numStrike += 1
        } else if keyNumbers.contains(userTryNumbers[idx]) {
            numBall += 1
        }
    }
    return (numStrike, numBall)
}
