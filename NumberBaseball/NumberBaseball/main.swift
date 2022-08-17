//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []
var userNumbers: [Int] = []
var tryNumber: Int = 9
var ballCount : Int = 0
var strikeCount : Int = 0

func generateThreeRandomNumbers() -> [Int] {
    var numbers: Set<Int> = []
    
    while numbers.count < 3 {
        let num = Int.random(in: 1...9)
        numbers.update(with: num)
    }
    return Array(numbers)
}

func foundBall() -> Int {
    let pairNumbers = zip(userNumbers, computerNumbers)
    
    for pairNumber in pairNumbers {
        if computerNumbers.contains(pairNumber.0) && pairNumber.0 != pairNumber.1 {
            ballCount += 1
        }
    }
    return ballCount
}

func foundStrike() -> Int {
    let pairNumbers = zip(userNumbers, computerNumbers)

    for pairNumber in pairNumbers {
        if pairNumber.0 == pairNumber.1 {
            strikeCount += 1
        }
    }
    return strikeCount
}

func startBaseBallGame() {
    ballCount = 0
    strikeCount = 0
    tryNumber -= 1
    userNumbers = generateThreeRandomNumbers()
    
    print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
    print(foundStrike() ," 스트라이크,", foundBall(), " 볼")
    
    if tryNumber == 0 {
        if foundStrike() == 3 {
            print("사용자 승리!")
            return
        }
        print("컴퓨터 승리...!")
        return
    } else {
        if foundStrike() == 3 {
            print("사용자 승리!")
            return
        }
        print("남은 기회 : \(tryNumber)")
        print("\n")
    }
}

computerNumbers = generateThreeRandomNumbers()

while(tryNumber > 0) {
    startBaseBallGame()
}
