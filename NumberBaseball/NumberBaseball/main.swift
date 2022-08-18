//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


func generateNumber() -> [Int] {
    var remainingNumbers = Array(1...9)
    var randomNumbers: [Int] = []
    while randomNumbers.count < 3 {
        let number = Int(arc4random_uniform(UInt32(remainingNumbers.count)))
        var selectedNumber = remainingNumbers[number]
        if selectedNumber != 0 {
            randomNumbers.append(selectedNumber)
        }
        remainingNumbers[number] = 0
    }
    return randomNumbers
}

func getUserBall(userNumbers: [Int]) {
//    let userNumberList = readLine()?.split(separator: " ").map({ number in
//        return Int(number)
//    })
    print("임의의 수 : ", terminator: "")
    for num in userNumbers {
        print(num, terminator: " ")
    }
}

func compareNumbers() -> (Int, Int) {
    let userNumbers = generateNumber()
    print(userNumbers)
    getUserBall(userNumbers: userNumbers)
    var strike = 0
    var ball = 0
    for index in 0...2 {
        if computerNumbers[index] == userNumbers[index] {
            strike += 1
        } else if userNumbers.contains(computerNumbers[index]) {
            ball += 1
        }
    }
    return (strike, ball)
}
var remaining = 9
let computerNumbers = generateNumber()
print(computerNumbers)

func gameStart() {
    var run = true
    while run {
        let userNumbers = generateNumber()
        let (strike, ball) = compareNumbers()
        print("\(strike) 스트라이크, \(ball) 볼")
        remaining -= 1
        print("남은 기회 : \(remaining)")
        if remaining == 0 {
            print("컴퓨터 승리...!")
            run = false
        } else if strike == 3 {
            print("사용자 승리...!")
            run = false
        }
    }
}

gameStart()
