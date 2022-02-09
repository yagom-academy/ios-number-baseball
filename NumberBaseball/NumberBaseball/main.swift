//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


var numbersByComputer: [Int] = []
var numberOfChance: Int = 9
var numbersByUser: [Int] = []

func returnRandomNumbers() -> [Int] {
    var tempSet = Set<Int>()
    
    while(tempSet.count < 3) {
        tempSet.insert(Int.random(in:1...9))
    }
    return Array(tempSet)
}

func returnResult() -> String {
    return "\(checkStrike()) 스트라이크, 볼"
}

func checkStrike() -> Int {
    var count: Int = 0
    for i in 0...2 {
        if numbersByUser[i] == numbersByComputer[i] {
            count += 1
        }
    }
    return count
}
/*
func checkBall() -> Int {
    
}
 */

func startGame() {
    
}

numbersByComputer = returnRandomNumbers()

while(numberOfChance > 0) {
    numbersByUser = returnRandomNumbers()
    print(numbersByUser)
    let gameResult = returnResult()
    print(gameResult)
    if gameResult == "3 스트라이크, 0 볼" {
        print("사용자 승리!")
        break
    }
    numberOfChance -= 1
    print("남은 기회 : \(numberOfChance)")
}

