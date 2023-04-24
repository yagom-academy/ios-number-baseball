//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func checkBallStrikeCount(to: [Int], and: [Int]){
    var ball: Int
    var strike: Int
}

func initRandomNumber() -> from: [Int] {
    var randomNumbers: Array<Int> = Array<Int>()
    var randomNumberSet: Set<Int> = Set<Int>()
}

func startBaseballGame() {
    var answerCountCheck: Set<Int> = Set<Int>()
    var answerNumbers: Array<Int> = Array<Int>()
    var lastChance = 9
    
    while answerCountCheck.count < 3 {
        answerCountCheck.insert(Int.random(in: 1...9))
    }

    for number in answerCountCheck {
        answerNumbers.append(number)
    }
    
    while lastChance > 0 {
        checkBallStrikeCount(to: answerNumbers, and: initRandomNumber())
        
        
        
        lastChance -= 1
    }
}

while randomNumberSet.count < 3 {
    randomNumberSet.insert(Int.random(in: 1...9))
}

for randomNumber in randomNumberSet {
    randomNumbers.append(randomNumber)
}

print("임의의 수 : \(randomNumbers)")

for number in inputNumber {
    if answerNumber.contains(Int(number) ?? 0) {
        ball += 1
    }
}

for index in 0...2 {
    if answerNumbers[index] == Int(inputNumber[index]) {
        ball -= 1
        strike += 1
    }
}
lastChance -= 1

print("\(strike) 스트라이크, \(ball) 볼")
print("남은 기회 : \(lastChance)")

if strike == 3 {
    print("사용자 승리!")
}
