//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let computerNumber: Set<Int>
var gameCount = 9

func getRandomNumbers() -> [Int] {
    var randomNumbers = Set<Int>()
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 0...9))
    }
    //let randomNumber = Array(randomNumbers) -> 변수 선언해주는 방법이 좋은지
    return Array(randomNumbers)
}

func compareNumbers(computer: [Int], user: [Int]) -> (strike: Int, ball: Int) {
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
    return (strike, ball)
}
