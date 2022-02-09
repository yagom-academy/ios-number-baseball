//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


var numbersByComputer: [Int] = []
var numberOfChance: Int = 9
var numbersByUser: [Int] = []
var strikeCount: Int = 0
var ballCount: Int = 0

func returnRandomNumbers() -> [Int] {
    var numberSet = Set<Int>()
    
    while(numberSet.count < 3) {
        numberSet.insert(Int.random(in: 1...9))
    }
    

    return Array(numberSet)
}
/* old one
func returnResult() -> String {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for i in 0...2 {
        if numbersByUser[i] == numbersByComputer[i] {
            strikeCount += 1
        } else if numbersByComputer.contains(numbersByUser[i]) {
            ballCount += 1
        }
    }
    return "\(strikeCount) 스트라이크, \(ballCount) 볼"
}
*/

func returnResult() {
    strikeCount = 0
    ballCount = 0
    
    for i in 0...2 {
        if numbersByUser[i] == numbersByComputer[i] {
            strikeCount += 1
        } else if numbersByComputer.contains(numbersByUser[i]) {
            ballCount += 1
        }
    }
    
    /*
    if strikeCount == 3 {
        print("사용자 승리!!")
        return
    }
     */
}

func startGame() {
    numbersByComputer = returnRandomNumbers()
    
    while(numberOfChance > 0 && strikeCount < 3) {
        numbersByUser = returnRandomNumbers()
        
        /*
        print("임의의 수 : ", terminator: "")
        numbersByUser.forEach {
            print($0, terminator: " ")
        }
        print()
        */
        
        print("임의의 수 : \(numbersByUser[0]) \(numbersByUser[1]) \(numbersByUser[2])")
        returnResult()
        
        //if strikeCount == 3 {
        //    print("사용자 승리!")
        //    break
        //}
        
        if (numberOfChance - 1) == 0 {
            print("컴퓨터 승리...!")
        }
        
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        numberOfChance -= 1
        print("남은 기회 : \(numberOfChance)")
    }
}

startGame()
