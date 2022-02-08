//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var tryCount: Int = 9

func makeThreeRandomNumbers() -> Set<Int> {
    var randomNumber: Int
    var randomNumberSet: Set<Int> = []
    while(randomNumberSet.count < 3) {
        randomNumber = Int.random(in: 1...9)
        randomNumberSet.insert(randomNumber)
    }
    return randomNumberSet
}

var computerRandomNumbers:[Int] = Array(makeThreeRandomNumbers())
var userRandomNumbers:[Int] = Array(makeThreeRandomNumbers())

func compareUserAndComputer() {
    var strike = 0
    var ball = 0
    if computerRandomNumbers[0] == userRandomNumbers[0] {
        strike += 1
    } else {
        ball += 1
    }
    if computerRandomNumbers[1] == userRandomNumbers[1] {
        strike += 1
    } else {
        ball += 1
    }
    if computerRandomNumbers[2] == userRandomNumbers[2] {
        strike += 1
    } else {
        ball += 1
    }
    print(strike, ball)
}

compareUserAndComputer()
