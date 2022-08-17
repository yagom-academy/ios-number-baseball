//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []
var userNumbers: [Int] = []
var tryNumber: Int = 9

func generateThreeRandomNumbers() -> [Int] {
    var numbers: Set<Int> = []
    
    while numbers.count < 3 {
        let num = Int.random(in: 1...9)
        numbers.update(with: num)
    }
    return Array(numbers)
}

func foundBall() -> Int {
    var ballCount: Int = 0
    let pairNumbers = zip(userNumbers, computerNumbers)
    
    for (userNumber, computerNumber) in pairNumbers {
        if computerNumbers.contains(userNumber) && userNumber != computerNumber {
            ballCount += 1
        }
    }
    return ballCount
}

func foundStrike() -> Int {
    var strikeCount : Int = 0
    let pairNumbers = zip(userNumbers, computerNumbers)

    for (userNumber, computerNumber) in pairNumbers {
        if userNumber == computerNumber {
            strikeCount += 1
        }
    }
    return strikeCount
}

func decideUserVictory() {
    if foundStrike() == 3 {
        print("사용자 승리!")
        return
    }
}

func startBaseBallGame() {
    tryNumber -= 1
    userNumbers = generateThreeRandomNumbers()
    
    print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
    print(foundStrike() ," 스트라이크,", foundBall(), " 볼")
    
    if tryNumber == 0 {
        decideUserVictory()
        print("컴퓨터 승리...!")
        return
    } else {
        decideUserVictory()
        print("남은 기회 : \(tryNumber)")
        print("\n")
    }
}

computerNumbers = generateThreeRandomNumbers()

while(tryNumber > 0) {
    startBaseBallGame()
}
