//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerBalls: Set<Int> = []
var userBalls: Set<Int> = []

while true {
    computerBalls = makeThreeBalls()
    userBalls = makeThreeBalls()
    checkBalls(userBalls)
    break
}
var restOfTimes: Int = 9
func makeThreeBalls() -> Set<Int> {
    var balls: Set<Int> = []
    while balls.count < 3 {
        balls.insert(Int.random(in: 1...9))
    }
    return balls
}

func checkBalls(_ userBalls: Set<Int>) {
    print("임의의 수 : ", terminator: "")
    userBalls.forEach{print("\($0)", terminator: " ")}
}
