//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


var computerNumber = makeRandomNumber()
var userNumber = makeRandomNumber()
var remainingNumber = 9
var userNumberList = Array(userNumber)
let computerNumberList = Array(computerNumber)


func makeRandomNumber() -> Set<Int> {
    var numbers = Set<Int>()
    
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    
    return numbers
}


func startGame(with userArray: Array<Int>, and computerArray: Array<Int>) {
    
    print("임의의 수 :", userArray[0], userArray[1], userArray[2])
    
    let strikesAndBalls = compareNumbers(in: userArray, with: computerArray)
    let strikes = strikesAndBalls["strikes"] ?? 0
    let balls = strikesAndBalls["balls"] ?? 0
    
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
        startGame(with: userNumberList, and: computerNumberList)
        return
    }
}


func compareNumbers(in userArray: Array<Int>, with computerArray: Array<Int>) -> Dictionary<String, Int> {
    
    let strikes = countStrike(in: userArray, with: computerArray)
    let balls = countBall(in: userArray, with: computerArray)
    
    return ["strikes": strikes, "balls": balls]
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


startGame(with: userNumberList, and: computerNumberList)
