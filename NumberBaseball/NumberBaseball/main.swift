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
    //let randomNumber = Array(randomNumbers) -> 변수 선언해주는 방법이 좋은지
    return Array(randomNumbers)
}

func compareNumbers(_ computer: [Int], _ user: [Int]) -> (strike: Int, ball: Int) {
    var strike: Int = 0
    var ball: Int = 0
    var diffNumbers = [Int]() // 스트라이크가 아닌 수의 배열
    
    for index in 0...2 {
        if computer[index] == user[index] {
            strike += 1
        } else {
            diffNumbers.append(computer[index])
        }
    }
    
    for index in diffNumbers {
        if user.contains(index){
            ball += 1
        }
    }
    
    print("\(strike) 스트라이크, \(ball) 볼")
    
    return (strike, ball)
}

func startGame() {
    let computerNumbers = getRandomNumbers()
    
    while gameCount != 0 {
        var userNumbers = getRandomNumbers()
        print("임의의 수 : \(userNumbers)")
        
        compareNumbers(computerNumbers, userNumbers)
        
        gameCount -= 1
        print("남은 기회 : \(gameCount)")
    }
}

startGame()
