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

func checkStrike(userNumbers: [Int], randomNumbers: [Int]) -> Int {
    var strike = 0
    var ball = 0
    for (index, number) in userNumbers.enumerated() {
        if number == randomNumbers[index] {
            strike += 1
        } else {
            ball += checkBall(userNumber: number, randomNumbers: randomNumbers)
        }
    }
    print(strike, ball)
    return strike
}

func checkBall(userNumber: Int, randomNumbers: [Int]) -> Int {
    var ball = 0
    
    for randomNumber in randomNumbers {
        if userNumber == randomNumber {
            ball += 1
            break
        }
    }
    
    return ball
}

func compareNumbers(userNumbers: [Int], randomNumbers: [Int]) -> Int {
    checkStrike(userNumbers: userNumbers, randomNumbers: randomNumbers)
    return 0
}

mainLoop()
