//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func mainLoop() {
    var randomNumbers: [Int] = []
    var userRandomNumbers: [Int] = []
    var chance = 9
    randomNumbers = makeRandomNumber()
    userRandomNumbers = makeUserRandomNumber()
    print(randomNumbers)
    print("임의의 수 : \(userRandomNumbers)")
    compareNumbers(userNumbers: randomNumbers, randomNumbers: userRandomNumbers)
    
    /*while chance != 0 {
        
    }*/
}

func makeRandomNumber() -> [Int] {
    var numbers: Set<Int> = []
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    return numbers.map { Int($0) }
}

func makeUserRandomNumber() -> [Int] {
    var numbers: Set<Int> = []
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    return numbers.map { Int($0) }
}

func compareNumbers(userNumbers: [Int], randomNumbers: [Int]) -> Int {
    var strike = 0
    if userNumbers[0] == randomNumbers[0] {
        strike += 1
    }
    if userNumbers[1] == randomNumbers[1] {
        strike += 1
    }
    if userNumbers[2] == randomNumbers[2] {
        strike += 1
    }
    print(strike)
    return 0
}

mainLoop()
