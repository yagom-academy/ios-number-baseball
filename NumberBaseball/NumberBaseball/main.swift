//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var remainChance = 9
var computerChoice = makeRandomNumber()

func makeRandomNumber() -> [Int] {
    var randomNum: Set<Int> = []
    
    while randomNum.count < 3 {
        randomNum.insert(Int.random(in: 1...9))
    }
    return Array(randomNum)
}

func compareRandomNumber(randomNumber: [Int]) -> [Int] {
    var strike = 0
    var ball = 0
    
    for (index, number) in randomNumber.enumerated() {
        if index == computerChoice.firstIndex(of: number) {
            strike += 1
        } else if computerChoice.contains(number) {
            ball += 1
        }
    }
    return [ball, strike]
}

func startGame() {
    while remainChance >= 0 {
        let userNumber = makeRandomNumber()
        let result = compareRandomNumber(randomNumber: userNumber)
        print("임의의 수 :\(userNumber.map { String($0) }.joined(separator: " "))")
        print("\(result[1]) 스트라이크, \(result[0]) 볼")
        if remainChance != 0 {
            print("남은 기회 : \(remainChance)")
        } else {
            print("컴퓨터 승리")
        }
        if result[1] == 3 {
            print("사용자 승리")
            break
        }
        remainChance -= 1
    }
}
startGame()
