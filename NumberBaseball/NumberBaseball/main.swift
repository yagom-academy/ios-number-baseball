//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func mainLoop() {
    var randomNumbers: Set<Int> = []
    var userRandomNumbers: Set<Int> = []
    var chance = 9
    randomNumbers = makeRandomNumber()
    userRandomNumbers = makeUserRandomNumber()
    while chance != 0 {
        
    }
}

func makeRandomNumber() -> Set<Int> {
    var numbers: Set<Int> = []
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    return numbers
}

func compareNumbers(userNumbers: Set<Int>, randomNumbers: Set<Int>) -> Int {
    return userNumbers.intersection(randomNumbers).count
}

func makeUserRandomNumber() -> Set<Int> {
    var numbers: Set<Int> = []
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    return numbers
}
