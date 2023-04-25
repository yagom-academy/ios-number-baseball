//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var number: [Int] = []
var guess: [Int] = []
var turnNumber = 0

while number.count < 3 {
    let randomNumber = Int.random(in: 1...9)
    if !number.contains(randomNumber) {
        number.append(randomNumber)
    }
}

while turnNumber < 9 {
    var ball = 0
    var strike = 0
    while guess.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !guess.contains(randomNumber) {
            guess.append(randomNumber)
        }
    }
    for g in 0...2 {
        if guess[g] == number[g] {
            strike += 1
        } else if number.contains(guess[g]) {
            ball += 1
        }
    }
    print("임의의 수 : \(number[0]) \(number[1]) \(number[2])")
    print("\(strike) 스트라이크, \(ball) 볼")
    turnNumber += 1
}
