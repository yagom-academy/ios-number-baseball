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

var strikes = 0
var balls = 0

func compareNumbers(computer: Array<Int>, user: Array<Int>) {
    while remainingNumber > 0 {
        userNumber = makeRandomNumber()
        userNumberList = Array(userNumber)
        
        isStrike(computer: computer, user: user, strikes: &strikes)
        isBall(computer: computer, user: user, balls: &balls)
        
        print("임의의 수 : ", terminator: " ")
        userNumberList.forEach {
            print($0, terminator: " ")
        }
        print("")
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
            strikes = 0
            balls = 0
        }
    }
}

func isStrike(computer: Array<Int>, user: Array<Int>, strikes: inout Int) {
    for i in 0..<user.count {
        if user[i] == computer[i] {
            strikes += 1
        }
    }
}

func isBall(computer: Array<Int>, user: Array<Int>, balls: inout Int) {
    for i in 0..<user.count {
        if computer.contains(user[i]) && computer[i] != user[i] {
            balls += 1
        }
    }
}

compareNumbers(computer: computerNumberList, user: userNumberList)
