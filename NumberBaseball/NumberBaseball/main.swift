//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/*func runProgram() {
    var run: Bool = true
    while run == true {
        mainLoop()
        
        
    }
}*/

func mainLoop(run: inout Bool) {
    var randomNumbers: [Int] = []
    var userRandomNumbers: [Int] = []
    var chance = 9
    randomNumbers = makeRandomNumber()
    
    while chance != 0 {
        userRandomNumbers = makeUserRandomNumber()
        print("임의의 수 : \(userRandomNumbers)")

        compareNumbers(userNumbers: randomNumbers, randomNumbers: userRandomNumbers)
        chance -= 1
        print("남은 기회 : \(chance)")
    }
    print("컴퓨터 승리...!")
}

/*func lifeCount(life: Int) {
    var restLife = life
    
    while restLife != 0 {
        
        
        restLife -= 1
    }
}*/

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
    print("\(strike) 스트라이크, \(ball) 볼")
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
