//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var gameCount = 9

func getRandomNumbers() -> [Int] {
    var randomNumbers = Set<Int>()
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 0...9))
    }
    return Array(randomNumbers)
}

//func getStrike(_ computer: Int, _ user: Int){
//    if computer == user {
//
//    } else {
//
//    }
//}

func compareNumbers(_ computer: [Int], _ user: [Int]) -> (strike: Int, ball: Int) {
    var strike: Int = 0
    var ball: Int = 0
    var tempNumbers = [Int]()   // 스트라이크가 아닌 숫자의 배열 생성, 임시변수
    
    for index in 0...2 {
//        getStrike(computer[index], user[index])
        if computer[index] == user[index] {
            strike += 1
        } else {
            tempNumbers.append(computer[index])
        }
    }
    
    for index in tempNumbers {
        if user.contains(index){
            ball += 1
        }
    }
//    tempNumbers = []
    return (strike, ball)
}

func startGame() {
    let computerNumbers = getRandomNumbers()
    
    while gameCount != 0 {
        var userNumbers = getRandomNumbers()
        print("임의의 수 : \(userNumbers)")
        
        var result = compareNumbers(computerNumbers, userNumbers)
        if result.strike == 3 {
            print("사용자 승리!")
            break
        }
        gameCount -= 1
        if gameCount == 0 {
            print("컴퓨터의 승리...!")
        }
        print("\(result.strike) 스트라이크, \(result.ball) 볼")
        print("남은 기회 : \(gameCount)")
        
    }
    print("\(computerNumbers)")
}

startGame()
