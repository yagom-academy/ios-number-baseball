//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


func makeRandomNumbers() -> [Int] {
    var result: [Int] = []
    while result.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !result.contains(randomNumber) {
            result.append(randomNumber)
        }
    }
    return result
}

var computerNumbers: [Int] = makeRandomNumbers()
var leftChances = 9
var userNumbers: [Int] = []

print(makeRandomNumbers())


func compareComputerNumbers(with userNumbers: [Int]) -> [Int]{
    var ball = 0
    var strike = 0
    
    for i in 0...2 {
        (computerNumbers[i] == userNumbers[i]) ? (strike += 1) : ()
    }
    
    for userNumber in userNumbers {
        (!computerNumbers.contains(userNumber)) ? (ball += 1) : ()
    }
    
    ball -= strike
    
    return [ball, strike]
}


print(compareComputerNumbers(with: makeRandomNumbers()))
