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
    print(computerNumbers)
    var userNumbers: [Int]
    var chance = 9
    var strike: Int
    var ball: Int
    
    while chance != 0 {
        chance -= 1
        userNumbers = generateRandomNumber()
        print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        if chance < 1 {
            print("컴퓨터 승리...!")
        }
        strike = checkStrike(user: userNumbers, computer: computerNumbers)
        ball = checkBall(user: userNumbers, computer: computerNumbers) - strike
        print("\(strike) 스트라이크, \(ball) 볼")
        if strike == 3 {
            print("사용자 승리!!")
            break
        }
        print("남은 기회 : \(chance)")
    }
}

startGame()
