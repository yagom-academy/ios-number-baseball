//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var answerBall: Array<Int> = []
var firstBall: Int
var secondBall: Int
var thirdBall: Int
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

func compareBall(userBall: Array<Int>, answerBall: Array<Int>) -> Array<Int> {
    var ballStrike: Array<Int> = [0, 0]
    for index in 0..<userBall.count {
        if userBall[index] == answerBall[index] {
            ballStrike[1] += 1
        } else {
            if answerBall.contains(userBall[index]) {
                ballStrike[0] += 1
            }
        }
    }
    
    return ballStrike
}

func startGame() {
    answerBall = createRandomNumber()
    
    while chance > 1 {
        var userBall = createRandomNumber()
        chance -= 1
        print("임의의 수 : \(userBall.map{ String($0) }.joined(separator: " "))")
        let ballStrike = compareBall(userBall: userBall, answerBall: answerBall)
        let ball = ballStrike[0]
        let strike = ballStrike[1]
        print("\(strike) 스트라이크, \(ball) 볼")
        if strike == 3 {
            break
        }
        print("남은 기회 : \(chance)")
        print("컴퓨터 승리...!")
    }
}

startGame()
