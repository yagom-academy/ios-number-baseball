//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func CreateRandomNums() -> [Int] {
    var createdNums = [Int]()
    
    while createdNums.count < 3 {
        let createdRandomNum = Int.random(in:1...9)
        
        if createdNums.contains(createdRandomNum) {
            continue
        } else {
            createdNums.append(createdRandomNum)
        }
    }
    
    return createdNums
}

func ReturnResult(randomNums: [Int]) -> [Int] {
    var strike = 0
    var ball = 0
    var result = [Int]()
    
    for i in 0...2 {
        if computerRandomNums[i] == randomNums[i] {
            strike += 1
        } else if randomNums.contains(computerRandomNums[i]) {
            ball += 1
        }
    }

    result.append(strike)
    result.append(ball)
    
    return result
}

func StartGame() {
    while remain > 0 {
        let userRandomNums = CreateRandomNums()
        let gameResult = ReturnResult(randomNums: userRandomNums)
        remain -= 1
        
        print("임의의 수 : \(userRandomNums[0]) \(userRandomNums[1]) \(userRandomNums[2])")
        print("\(gameResult[0]) 스트라이크, \(gameResult[1]) 볼")
        
        if gameResult[0] == 3 {
            print("사용자 승리...!")
            break
        }
        
        if remain == 0 {
            print("컴퓨터 승리...!")
        } else {
            print("남은 기회 : \(remain)")
        }
    }
}

let computerRandomNums = CreateRandomNums()
var remain = 9

StartGame()
