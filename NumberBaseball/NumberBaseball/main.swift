//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var answerBall : Array<Int> = []
var chance = 9

func createRandomNumber() -> Array<Int> {
    var numbers : Array<Int> = []
    
    while numbers.count < 3 {
        let number = Int.random(in: 1...9)
        if !numbers.contains(number) {
            numbers.append(number)
        }
    }
    
    return numbers
}

func compareBall(userBall: Array<Int>, answerBall: Array<Int>) -> Array<Int> {
    var ballStrike : Array<Int> = [0, 0]
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
