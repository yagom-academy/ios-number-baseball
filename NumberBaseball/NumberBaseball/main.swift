//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func checkBallStrikeCount() {
    
}

var answerNumbers = [Int]()
var lastChance = 9
var ball: Int
var strike: Int
var answerCountCheck: Set<Int> = Set<Int>()
var randomNumbers = [Int]()
var randomNumberSet: Set<Int> = Set<Int>()

while randomNumberSet.count < 3 {
    randomNumberSet.insert(Int.random(in: 1...9))
}

for randomNumber in randomNumberSet {
    randomNumbers.append(randomNumber)
}

print("임의의 수 : \(randomNumbers)")

while answerCountCheck.count < 3 {
    answerCountCheck.insert(Int.random(in: 1...9))
}

for number in answerCountCheck {
    answerNumbers.append(number)
}

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
