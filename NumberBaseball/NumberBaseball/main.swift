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

func ReturnResult() -> [Int] {
    let randomNums = CreateRandomNums()
    var strike = 0
    var ball = 0
    var result = [Int]()
    
    for i in 0...2 {
        if nums[i] == randomNums[i] {
            strike += 1
        } else if randomNums.contains(nums[i]) {
            ball += 1
        }
    }
    
    for randomNum in randomNums {
        result.append(randomNum)
    }
    result.append(strike)
    result.append(ball)
    
    return result
}

func StartGame() {
    while tryNum > 0 {
        let gameResult = ReturnResult()
        tryNum -= 1
        print("임의의 수 : \(gameResult[0]) \(gameResult[1]) \(gameResult[2])")
        print("\(gameResult[3]) 스트라이크, \(gameResult[4]) 볼")
        
        if gameResult[3] == 3 {
            print("사용자 승리...!")
            break
        }
        
        if tryNum == 0 {
            print("컴퓨터 승리...!")
        } else {
            print("남은 기회 : \(tryNum)")
        }
    }
}

let nums = CreateRandomNums()
var tryNum = 9

StartGame()
