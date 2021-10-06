//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


func makeRandomNumbers() -> [Int] {
    var result: Set<Int> = []
    while result.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        checkUniqueAndInsert(randomNumber, into: &result)
    }
    return result.shuffled()
}

func checkUniqueAndInsert(_ value: Int, into result: inout Set<Int>) {
    if !result.contains(value) {
        result.insert(value)
    }
}



var computerNumbers: [Int] = makeRandomNumbers()

func compareComputerNumbers(with userNumbers: [Int]) -> [Int]{
    var ball = 0
    var strike = 0
    
    for i in 0...2 {
        (computerNumbers[i] == userNumbers[i]) ? (strike += 1) : ()
    }
    
    for userNumber in userNumbers {
        (computerNumbers.contains(userNumber)) ? (ball += 1) : ()
    }
    
    ball -= strike
    
    return [ball, strike]
}

func startGame() {
    for _ in 0...8 {
        let userNumbers = makeRandomNumbers()
        print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        let result = compareComputerNumbers(with: userNumbers)
        print("\(result[1]) 스트라이크, \(result[0]) 볼")
    }
}

