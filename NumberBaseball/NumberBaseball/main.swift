//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers = makeThreeNumbers()
var userNumbers: [Int] = []
var leftCount: Int = 9
var isUserWin: Bool = false

func playBaseBallGame() {
    while leftCount > 0 {
        var strikeCount: Int = 0
        var ballCount: Int = 0
        userNumbers = makeThreeNumbers()
        (strikeCount, ballCount) = compareNumbers(userNumbers, with: computerNumbers)
        leftCount -= 1
        print("\n\(strikeCount) 스트라이크, \(ballCount) 볼")
        if leftCount != 0 {
            print("남은 기회 : \(leftCount)")
        }
        if strikeCount == 3 {
            isUserWin = true
            break
        }
    }
    if isUserWin {
        print("사용자 승리")
    } else {
        print("컴퓨터 승리...!")
    }
}

func makeThreeNumbers() -> [Int] {
    var numbers: Set<Int> = []
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    return Array(numbers)
}

func compareNumbers(_ userNumbers: [Int], with computerNumbers: [Int]) -> (Int, Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    print("임의의 수 : ", terminator: "")
    userNumbers.forEach{print("\($0)", terminator: " ")}
    
    (0..<computerNumbers.count).forEach{ index in
        guard computerNumbers[index] != userNumbers[index] else {
            strikeCount += 1
            return
        }
        guard !computerNumbers.contains(userNumbers[index]) else {
            ballCount += 1
            return
        }
    }
    return (strikeCount, ballCount)
}

playBaseBallGame()
