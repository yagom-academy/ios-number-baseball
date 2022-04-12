//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumber = Set<Int>()

while computerNumber.count < 3 {
    computerNumber.insert(Int.random(in: 1...9))
}

var remainingNumber = 9
var userNumber = Set<Int>()

func makeRandomNumber() -> Set<Int> {
    var numbers = Set<Int>()
    
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    return numbers
}

userNumber = makeRandomNumber()
var userNumberList = Array(userNumber)
let computerNumberList = Array(computerNumber)

func compareNumbers(computer: Array<Int>, user: Array<Int>) {
    
    print("임의의 수 : ", terminator: " ")
    userNumberList.forEach {
        print($0, terminator: " ")
    }
    print("")
    
    let strikes = isStrike(computer: computer, user: user)
    let balls = isBall(computer: computer, user: user)
    print("\(strikes) 스트라이크, \(balls) 볼")
    
    remainingNumber -= 1
    
    if strikes == 3 {
        print("사용자 승리!")
        return
    } else if remainingNumber == 0 {
        print("남은 기회: \(remainingNumber)")
        print("컴퓨터 승리...!")
        return
    } else {
        print("남은 기회: \(remainingNumber)")
        userNumber = makeRandomNumber()
        userNumberList = Array(userNumber)
        compareNumbers(computer: computerNumberList, user: userNumberList)
        return
    }
}

func isStrike(computer: Array<Int>, user: Array<Int>) -> Int {
    var strikes = 0
    for i in 0..<user.count {
        if user[i] == computer[i] {
            strikes += 1
        }
    }
    
    return strikes
}

func isBall(computer: Array<Int>, user: Array<Int>) -> Int {
    var balls = 0
    for i in 0..<user.count {
        if computer.contains(user[i]) && computer[i] != user[i] {
            balls += 1
        }
    }
    
    return balls
}

compareNumbers(computer: computerNumberList, user: userNumberList)
