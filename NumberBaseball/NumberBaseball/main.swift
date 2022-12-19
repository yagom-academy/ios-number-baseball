//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var answerBall: Array<Int> = []
var chance = 9

func createRandomNumber() -> Array<Int> {
    var numbers: Array<Int> = []
    
    while numbers.count < 3 {
        let number = Int.random(in: 1...9)
        if !numbers.contains(number) {
            numbers.append(number)
        }
    }
    
    return numbers
}

func compareBall(userBall: Array<Int>, answerBall: Array<Int>) -> [Int] {
    var ball = 0
    var strike = 0
    for index in 0..<userBall.count {
        if userBall[index] == answerBall[index] {
            strike += 1
        }
        if userBall[index] != answerBall[index], answerBall.contains(userBall[index]) {
            ball += 1
        }
    }
    return [ball, strike]
}

func startGame() {
    answerBall = createRandomNumber()
    
    while chance > 0 {
        let userBall = createRandomNumber()
        chance -= 1
        print("임의의 수 : \(userBall.map{ String($0) }.joined(separator: " "))")
        let ballStrike = compareBall(userBall: userBall, answerBall: answerBall)
        let ball = ballStrike[0]
        let strike = ballStrike[1]
        print("\(strike) 스트라이크, \(ball) 볼")
        if strike == 3 {
            print("사용자 승리...!")
            break
        }
        print("남은 기회 : \(chance)")
        if chance == 0 {
            print("컴퓨터 승리...!")
        }
    }
}

startGame()
