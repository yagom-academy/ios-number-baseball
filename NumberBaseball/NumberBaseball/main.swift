//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


var computerNumber = Set<Int>()
var userNumber = Set<Int>()
var remainingNumber = 9


while computerNumber.count < 3 {
    computerNumber.insert(Int.random(in: 1...9))
}

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


func compareNumbers(in userArray: Array<Int>, with computerArray: Array<Int>) {

    print("임의의 수 : ", terminator: " ")
    userArray.forEach {
        print($0, terminator: " ")
    }
    print("")
    
    let strikes = countStrike(in: userArray, with: computerArray)
    let balls = countBall(in: userArray, with: computerArray)
    
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
        compareNumbers(in: userNumberList, with: computerNumberList)
        return
    }
}


func countStrike(in userArray: Array<Int>, with computerArray: Array<Int>) -> Int {
    var strikes = 0
    
    for i in 0..<userArray.count {
        if userArray[i] == computerArray[i] {
            strikes += 1
        }
    }
    
    return strikes
}

func countBall(in userArray: Array<Int>, with computerArray: Array<Int>) -> Int {
    var balls = 0
    
    for i in 0..<userArray.count {
        if computerArray.contains(userArray[i]) && computerArray[i] != userArray[i] {
            balls += 1
        }
    }
    
    return balls
}


compareNumbers(in: userNumberList, with: computerNumberList)
