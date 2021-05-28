//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// MARK: --- Step 1
func makeRandomNumbers() -> Array<Int> {
    var numbers = Array<Int>()

    while numbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
    
        if !numbers.contains(randomNumber) {
            numbers.append(randomNumber)
        }
    }

    return numbers
}

func compareArrays( _ computerNumbers: Array<Int>, _ userNumbers: Array<Int>) -> (Int, Int) {
    var strike: Int = 0
    var ball: Int = 0

    for index in 0..<3 {
        if computerNumbers[index] == userNumbers[index] {
            strike += 1
        } else if computerNumbers.contains(userNumbers[index]) {
            ball += 1
        }
    }
    
    return (strike, ball)
}

func startGame() {
    var computerNumbers = Array<Int>()
    var tryCount: Int = 9

    while tryCount > 0 {
        computerNumbers = makeRandomNumbers()
        let autoPlayer = makeRandomNumbers()
        let (strike, ball) = compareArrays(computerNumbers, autoPlayer)

        print("임의의 수 : \(autoPlayer[0]) \(autoPlayer[1]) \(autoPlayer[2])")
        print("\(strike) 스트라이크, \(ball) 볼")

        tryCount -= 1
        print("남은 기회 : \(tryCount)")

        if strike > 2 {
            print("사용자 승리!")
            break
        } else if tryCount == 0 {
           print("컴퓨터 승리...!")
        }
    }
}

startGame()
