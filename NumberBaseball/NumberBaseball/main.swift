//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateRandomNumber() -> [Int] {
    var numbers: [Int] = []
    
    while numbers.count < 3 {
        let number = Int.random(in: 1...9)
        if !numbers.contains(number) {
            numbers.append(number)
        }
    }
    return numbers
}

func checkStrike(user: [Int], computer: [Int]) -> Int {
    var count = 0
    
    for number in 0...2 {
        if user[number] == computer[number] {
            count += 1
        }
    }
    return count
}

func checkBall(user: [Int], computer: [Int]) -> Int {
    var count = 0
    
    for computerNumber in computer {
        for userNumber in user {
            if computerNumber == userNumber {
                count += 1
            }
        }
    }
    return count
}

func startGame() {
    let computerNumbers = generateRandomNumber()
    var userNumbers: [Int]
    var chance = 9
    var strike: Int
    var ball: Int
    
    while chance != 0 {
        chance -= 1
        userNumbers = generateRandomNumber()
        print("\(StringPrintContents.randomNumber)\(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        if chance < 1 {
            print("\(StringPrintContents.lose)")
        }
        strike = checkStrike(user: userNumbers, computer: computerNumbers)
        ball = checkBall(user: userNumbers, computer: computerNumbers) - strike
        print("\(strike)\(StringPrintContents.strike)\(ball)\(StringPrintContents.ball)")
        if strike == 3 {
            print("\(StringPrintContents.win)")
            break
        }
        print("\(StringPrintContents.chance)\(chance)")
    }
}

startGame()
