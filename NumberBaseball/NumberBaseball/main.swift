//
//  NumberBaseball - main.swift
//  Created by 레옹아범 and Rowan.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var answerBall: Array<Int> = []
var chance = 9

func createRandomNumber() -> Array<Int> {
    var numbers: Array<Int> = []
    
    while numbers.count < 3 {
        let number = Int.random(in: 1...9)
        
        if numbers.contains(number) == false {
            numbers.append(number)
        }
    }
    
    return numbers
}

func compareBall(userBall: Array<Int>, answerBall: Array<Int>) -> (Int, Int) {
    var ball = 0
    var strike = 0
    
    for index in 0..<userBall.count {
        if userBall[index] == answerBall[index] {
            strike += 1
        } else if userBall[index] != answerBall[index], answerBall.contains(userBall[index]) {
            ball += 1
        }
    }
    
    return (ball, strike)
}

func readMenu() -> Bool {
    let inputValue = readLine()
    
    guard let menu = inputValue else {
        return false
    }
    
    if menu == "1" {
        return true
    }
    
    return false
}

func startGame() {
    answerBall = createRandomNumber()
    
    while chance > 0 {
        let userBall = createRandomNumber()
        let (ball, strike) = compareBall(userBall: userBall, answerBall: answerBall)
        
        chance -= 1
        print("임의의 수 : \(userBall.map{ String($0) }.joined(separator: " "))")
        print("\(strike) 스트라이크, \(ball) 볼")
        
        if let winner = decideWinner(strike: strike, chance: chance) {
            print("\(winner) 승리...!")
            break
        }
        
        print("남은 기회 : \(chance)")
    }
}

func decideWinner(strike: Int, chance: Int) -> String? {
    var winner: String?
    
    if strike == 3 {
        winner = "사용자"
    } else if chance == 0 {
        winner = "컴퓨터"
    }
    
    return winner
}

startGame()
