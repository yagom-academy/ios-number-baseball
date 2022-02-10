//
//  NumberBaseball - main.swift
//  Created by Roy and 쿼카 .
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let computerNumbers = generateRandomNumbers()
var remainingChangeCount: Int = 9

func generateRandomNumbers(range: ClosedRange<Int> = 1...9, three: Int = 3) -> Set<Int> {
    var randomNumbers: Set<Int> = []
    while randomNumbers.count < three {
        randomNumbers.insert(Int.random(in: range))
    }
    return randomNumbers
}

func compareNumbers(user: Set<Int>, computer: Set<Int>) -> (strikeResult: Int, ballResult: Int) {
    var (strikeCount, ballCount) = (0, 0)
    for index in Array(user).indices {
        strikeCount += Array(user)[index] == Array(computer)[index] ? 1 : 0
    }
    ballCount = (computer.intersection(user).count - strikeCount)
    return (strikeCount, ballCount)
}

func startGame() {
    while remainingChangeCount > 0 {
        let userNumbers = generateRandomNumbers()
        let (strikeCount, ballCount) = compareNumbers(user: userNumbers, computer: computerNumbers)
        remainingChangeCount -= 1 // 보류
        print("임의의 수 : \(userNumbers.description.trimmingCharacters(in: [",","[","]"]))")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회 : \(remainingChangeCount)")
        
        if strikeCount > 2 {
            print("사용자 승리...!")
            return
        } else if remainingChangeCount == 0 {
            print("컴퓨터 승리...!")
        }
    }
}
startGame()
