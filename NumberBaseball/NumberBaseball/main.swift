//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerBalls = makeThreeBalls()
var userBalls: Set<Int> = []
var restOfTimes: Int = 9

while restOfTimes > 0 {
    userBalls = makeThreeBalls()
    checkBalls(userBalls)
}

func makeThreeBalls() -> Set<Int> {
    var balls: Set<Int> = []
    while balls.count < 3 {
        balls.insert(Int.random(in: 1...9))
    }
    return balls
}

func checkBalls(_ userBalls: Set<Int>) {
    var strike = 0
    var ball = 0
    let computerBallsArray = Array(computerBalls)
    let userBallsArray = Array(userBalls)
    
    print("임의의 수 : ", terminator: "")
    userBalls.forEach{print("\($0)", terminator: " ")}
    
    (0..<computerBallsArray.count).forEach{ index in
        if computerBallsArray[index] == userBallsArray[index] {
            strike += 1
            return
        }
        guard computerBallsArray.contains(userBallsArray[index]) else {
            return
        }
        ball += 1
    }
    restOfTimes -= 1
    print("\n\(strike) 스트라이크, \(ball) 볼")
    if restOfTimes != 0 {
        print("남은 기회 : \(restOfTimes)")
    } else {
        print("컴퓨터 승리...!")
    }
    if strike == 3 {
        print("사용자 승리!")
    }    
}
